//
//  HomeScreen.swift
//  tabviewexample
//
//  Created by Eddy Mendoza on 20/12/24.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        ScrollView {
            VStack {
                
                TopSheet(color: .cyan){
                    
                    CardVerMas(title: "Tus operaciones frecuentes",
                               onClick: {
                        
                    }) {
                        LazyHStack {
                            ForEach(listOperationsFrecuently.indices, id: \.self) { index in
                                ItemOperation(operation: listOperationsFrecuently[index])
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal,16)
                    
                }.frame(minHeight: 220)
                
                CardVerMas(title: "Tus cuentas", onClick: {}) {
                    VStack{
                        CardInfo(colorBackIcon: .red, icon: "note.text", title: "Tarjeta de débito", amount: 0.00)
                        
                        CardInfo(colorBackIcon: .purple, icon: "percent", title: "Recompensas", amount: 0.60)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }.padding(.top, 16)
                    .padding(.horizontal, 24)
                
                CardVerMas(title: "Compra lo que quieras") {
                    
                } content: {
                    ScrollView(.horizontal){
                        HStack {
                            CircleIconText(icon: "plazavea", title: "Plaza vea")
                            CircleIconText(icon: "inkafarma", title: "Inkafarma")
                            CircleIconText(icon: "jokr", title: "JOKR")
                            CircleIconText(icon: "vivanda", title: "Vivanda")
                            CircleIconText(icon: "promart", title: "Promart")
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    }
                }.padding(.top, 16)
                    .padding(.horizontal, 24)
                
                VStack {
                    HeaderCardVerMas(title: "Beneficios y descuentos") {
                        
                    }.padding(16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<5) {_ in
                                CardBeneficios(style: .cyan)
                                    .frame(width: 320, height: 152)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
                    .frame(height: 120)
                
            }
        }
        .background(Rectangle().foregroundStyle(.gray)
            .opacity(0.15))
    }
}

struct TopSheet<Content: View, Style: ShapeStyle> : View {
    
    let color : Style
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(color)
                .frame(width: .infinity)
                .overlay {
                    ZStack {
                        VStack {
                            Rectangle()
                                .foregroundStyle(color)
                                .frame(width: .infinity , height: 100, alignment: .top)
                            Spacer()
                        }
                        
                        content()
                    }
                }
        }
    }
}

#Preview("TopSheet"){
    TopSheet(color: .cyan) {
        VStack {
            
        }
    }
    .foregroundStyle(.cyan)
}

struct CardVerMas<Content: View>: View {
    
    let title: String
    
    let onClick: () -> Void
    
    let content: () -> Content
    
    var body: some View {
        
        VStack {
            HeaderCardVerMas(title: title, onClick: onClick)
                .padding(.top, 16)
            content()
            
        }
        .background(RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(.white)
        )
        
        
    }
}

#Preview("CardVerMas") {
    CardVerMas(
        title: "Tus operaciones frecuentes",
        onClick: {}
    ) {
        LazyHStack {
            ForEach(listOperationsFrecuently.indices, id: \.self) { index in
                ItemOperation(operation: listOperationsFrecuently[index])
            }
        }
    }
    .frame(width: 356, height: 200, alignment: .top)
}

struct HeaderCardVerMas : View {
    
    let title: String
    
    let onClick: () -> Void
    
    var body: some View {
        HStack {
            
            let textTitle = String(
                format: NSLocalizedString(title, comment: "")
            )
            
            Text(textTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .bold()
                .padding(.horizontal,16)
                .lineLimit(1)
            
            Button(action: onClick) {
                Text("Ver más")
                    .font(.subheadline)
                    .foregroundStyle(.cyan)
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 16)
                    .foregroundStyle(.cyan)
            }.padding(.horizontal, 16)
            
        }
    }
}

#Preview("HeaderVerMas") {
    HeaderCardVerMas(title: "Beneficios y descuentos") {
        
    }.background(RoundedRectangle(cornerRadius: 12)
        .stroke(.cyan, lineWidth: 1))
}

#Preview {
    HomeScreen()
}

struct CardInfo< Style: ShapeStyle> : View {
    
    let colorBackIcon: Style
    
    let icon: String
    
    let title: String
    
    let amount: Double
    
    @State var showAmount : Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundStyle(colorBackIcon)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(colorBackIcon)
                    .opacity(0.1)
                )
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                HStack {
                    let textAmount = withAnimation(.easeInOut) {
                        if showAmount {
                            String(format: NSLocalizedString("decimal", comment: ""), amount)
                        } else {
                            "S/ *********"
                        }
                    }
                    
                    Text(textAmount)
                        .bold()
                        .font(.subheadline)
                    
                    let iconShow = if showAmount {
                        "eye.slash.circle.fill"
                    } else {
                        "eye.circle.fill"
                    }
                    
                    
                    Image(systemName: iconShow)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundStyle(.gray)
                        .padding(.leading, 8)
                        .onTapGesture {
                            showAmount.toggle()
                        }
                }
            }
            .padding(.horizontal, 8)
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
            .stroke(.gray, lineWidth: 1)
        )
        
    }
}

#Preview("CardInfo") {
    
    CardInfo(colorBackIcon: .red, icon: "creditcard", title: "Tarjeta de débito", amount: 10.00)
}


struct CircleIconText : View {
    
    let icon : String
    
    let title: String
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .clipShape(.circle)
                .frame(height: 36)
            
            Text(title)
                .font(.caption)
                .padding(.top, 8)
        }.padding(.horizontal, 12)
    }
}

#Preview("CircleIconText") {
    CircleIconText(icon: "plazavea", title: "Plaza vea")
}

struct CardBeneficios<Style: ShapeStyle> : View {
    
    let style: Style
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(style)
    }
}

#Preview("CardBeneficios") {
    CardBeneficios(style: .cyan)
        .frame(width:360,height: 160)
        .padding()
}

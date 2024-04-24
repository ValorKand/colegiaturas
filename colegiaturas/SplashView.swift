//
//  SplashView.swift
//  colegiaturas
//
//  Created by David Vales on 22/04/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var ocultar: Bool=false
    @State var funcion: Int=0
    @State var existeUsuario: Bool=false
    
    var body: some View {

        VStack {
            Image(systemName: "graduationcap")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("CTRL + ESC Colegiaturas")
            Button("Iniciar", action: {iniciaVista()})
        }
        .padding()
        .frame(width: 300, height: 200)
        .opacity(ocultar ? 0 : 1)
        
        if funcion == 1 {
            LoginView(existeUsuario: self.$existeUsuario)
        }
    }
    
    private func iniciaVista() {
        ocultar=true
        funcion=1
    }
}

#Preview {
    SplashView()
}

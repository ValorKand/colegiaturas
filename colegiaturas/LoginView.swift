//
//  MainView.swift
//  colegiaturas
//
//  Created by David Vales on 22/04/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var funcion: Int=0
    @State var ocultar: Bool=true
    @Binding var existeUsuario: Bool
    @State var textoUsuario: String=""
    @State var labelCargando: String=""
    @FocusState var enfocado: Bool
    
    @State var usuario: String=""
    @State var secreto: String=""
    @State var confirmaSecreto: String=""
    
    var body: some View {
        
        if funcion == 0 {
            ZStack {
                VStack {
                    Image(systemName: "graduationcap")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("CTRL + ESC Colegiaturas")
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                }
                .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                
                if existeUsuario == true {
                    ZStack{
                        HStack {
                            Text("**Bienvenido**")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120)
                        }
                        .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                        VStack {
                            Text("Usuario")
                            TextField("Pedrito", text: $usuario)
                                .frame(width: 200)
                            Text("Contraseña")
                            SecureField("Contraseña", text: $secreto)
                                .frame(width: 200)
                            Button("Iniciar Sesión", action: {iniciarSesion()})
                        }
                        .textFieldStyle(.roundedBorder)
                    }
                } else {
                    ZStack{
                        HStack {
                            Text("**Parece que eres nuevo por aquí. Registrate ahora**")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 125)
                        }
                        .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                        VStack {
                            Text("Usuario")
                            TextField("Pedrito", text: $usuario)
                                .focused($enfocado)
                                .frame(width: 200)
                                .disableAutocorrection(true)
                            Text("Contraseña")
                            SecureField("Contraseña", text: $secreto)
                                .focused($enfocado)
                                .frame(width: 200)
                            Text("Confirma contraseña")
                            SecureField("Contraseña", text: $confirmaSecreto)
                                .focused($enfocado)
                                .frame(width: 200)
                            Text(labelCargando)
                            Button("Registrarse", action: {registrarse()})
                            Button("Comenzar", action:{comenzar()})
                                .opacity(ocultar ? 0 : 1)
                            
                        }
                        .padding(.top)
                        .textFieldStyle(.roundedBorder)
                    }
                }
            }
            .padding()
            .frame(width: 500, height: 400)
        }
        if funcion == 1 {
            ContentView()
        }
        
    }
    
    func comenzar() {
        ocultar=true
        funcion=1
    }
    
    func iniciarSesion() {
        //El iniciar sesión ya debería llevar al panel principal
        existeUsuario=false
        if existeUsuario == true {
            ocultar=true
        } else {
            ocultar=true
        }
    }
    
    func registrarse() {
        if usuario == "" || secreto == "" || confirmaSecreto == "" {
            enfocado=true
            labelCargando="Todos los campos son obligatorios"
        } else {
            ocultar=false
            labelCargando="Te damos la bienvenida "+usuario+" Da clic en **Comenzar** para iniciar"
        }
        
        if secreto != confirmaSecreto {
            labelCargando="Las contraseñas no coinciden"
        }
    }
}

#Preview {
    LoginView(existeUsuario: .constant(false))
}

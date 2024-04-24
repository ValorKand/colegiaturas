//
//  ContentView.swift
//  colegiaturas
//
//  Creado por David Vales en 18/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var ocultar: Bool=true
    @FocusState var enfocado: Bool
    @State var estaEnfocado: Bool=false
    @State var funcion: Int=0
    @State var funcionString=""
    @State var guardandoLabel=""
    @State var cicloGuardado: String=""
    @State var Contenedor: Int=0
    @State var desactivado: Bool=false
    @State var preescolar: Bool=false
    @State var primaria: Bool=false
    @State var secundaria: Bool=false
    @State var bachillerato: Bool=false
    @State var nombrecolegio: String=""
    @State var razonsocial: String=""
    @State var cct: String=""
    @State var direccion: String=""
    @State var inscripcionCostoPreescolar: String=""
    @State var colegiaturaCostoPreescolar: String=""
    @State var inscripcionCostoPrimaria: String=""
    @State var colegiaturaCostoPrimaria: String=""
    @State var inscripcionCostoSecundaria: String=""
    @State var colegiaturaCostoSecundaria: String=""
    @State var inscripcionCostoBachillerato: String=""
    @State var colegiaturaCostoBachillerato: String=""
    
    @State var textoLabel: String="¡Hola!, te damos la bienvenida a ctrl + esc Colegiaturas \nTu administrador de colegiaturas."
    @State var ciclo_escolar: String=""
    
    var body: some View {
        VStack {
            Image(systemName: "graduationcap")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textoLabel)
                .multilineTextAlignment(.center)
            if Contenedor == 2 {
                HStack {
                    Text("Razón social")
                    TextField("Colegio Linux A.C.", text: $razonsocial)
                        .padding(2)
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .frame(width: 150)
                        .disabled(desactivado)
                        .focused($enfocado)
                    Text("Nombre del colegio")
                    TextField("Colegio Linux", text: $nombrecolegio)
                        .padding(2)
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .frame(width: 120)
                        .disabled(desactivado)
                        .focused($enfocado)
                }
                HStack {
                    Text("CCT")
                    TextField("27PPR0006A", text: $cct)
                        .padding(2)
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .frame(width: 120)
                        .disabled(desactivado)
                        .focused($enfocado)
                    Text("Dirección")
                    TextEditor(text: $direccion)
                        .lineLimit(4)
                        .padding(2)
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .frame(width: 150, height: 50)
                        .disabled(desactivado)
                        .focused($enfocado)
                }
            }
            if Contenedor == 3 {
                //Contenedor para ciclo escolar
                TextField("Ciclo escolar. Ej: 2023-2024", text: $cicloGuardado)
                    .padding(2)
                    .cornerRadius(5)
                    .disableAutocorrection(true)
                    .frame(width: 200)
                    .disabled(desactivado)
                    .focused($enfocado)
            } else if Contenedor == 5 {
                VStack {
                    //Contenedor para seleccionar niveles educativos
                    Text("\nSelecciona los niveles educativos que hay en tu escuela")
                    VStack(alignment: .leading) {
                        Toggle(isOn: $preescolar) {
                            Text("Preescolar")
                        }
                        .disabled(desactivado)
                        Toggle(isOn: $primaria) {
                            Text("Primaria")
                        }
                        .disabled(desactivado)
                        Toggle(isOn: $secundaria) {
                            Text("Secundaria")
                        }
                        .disabled(desactivado)
                        Toggle(isOn: $bachillerato) {
                            Text("Bachillerato")
                        }
                        .disabled(desactivado)
                        .toggleStyle(.checkbox)
                    }
                    .focused($enfocado)
                }
            } else if Contenedor == 7 {
                //Contenedor para configurar tarifas
                VStack(alignment: .center) {
                    
                    if preescolar == true {
                        Text("\n**Preescolar**")
                        HStack {
                            Text("Inscripción")
                            TextField("Ingresa el monto", text: $inscripcionCostoPreescolar)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                            Text("Colegiatura")
                            TextField("Ingresa el monto", text: $colegiaturaCostoPreescolar)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                        }
                    }
                    if primaria == true {
                        Text("\n**Primaria**")
                        HStack {
                            Text("Inscripción")
                            TextField("Ingresa el monto", text: $inscripcionCostoPrimaria)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                            Text("Colegiatura")
                            TextField("Ingresa el monto", text: $colegiaturaCostoPrimaria)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                        }
                    }
                    if secundaria == true {
                        Text("\n**Secundaria**")
                        HStack {
                            Text("Inscripción")
                            TextField("Ingresa el monto", text: $inscripcionCostoSecundaria)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                            Text("Colegiatura")
                            TextField("Ingresa el monto", text: $colegiaturaCostoSecundaria)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                        }
                    }
                    if bachillerato == true {
                        Text("\n**Bachillerato**")
                        HStack {
                            Text("Inscripción")
                            TextField("Ingresa el monto", text: $inscripcionCostoBachillerato)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                            Text("Colegiatura")
                            TextField("Ingresa el monto", text: $colegiaturaCostoBachillerato)
                                .padding(2)
                                .cornerRadius(5)
                                .disableAutocorrection(true)
                                .frame(width: 120)
                        }
                    }
                }
            }
            Text(guardandoLabel)
                .opacity(ocultar ? 0 : 1)
            Button(action: {self.actualizaLabel()}) {
                Label("Siguiente", systemImage: "arrow.right")
            }
            Text(funcionString)
        }
        .padding()
        .frame(width: 600, height: 500)
    }
    
    //funcion actualizar label
    func actualizaLabel() -> some View {
        funcion += 1
        funcionString=String(funcion)
        let textos=["Para comenzar, necesitamos saber algunas cosas sobre tu colegio.","Cuentanos más 😊" , "¿En que ciclo escolar estamos?", "Vamos a configurar tus niveles educativos", "Casi está todo listo \nAhora, agregaremos tus conceptos de pago"]
        
        switch funcion {
        case 1:
            textoLabel=textos[0]
        case 2:
            textoLabel=textos[1]
            Contenedor=2
        case 3:
            if razonsocial == "" && nombrecolegio == "" && cct == "" && direccion == "" {
                funcion-=1
                ocultar=false
                enfocado=true
                guardandoLabel="Todos los campos son obligatorios"
            } else {
                ocultar=false
                guardandoLabel="Listo, hemos guardado la información"
                desactivado=true
            }
        case 4:
            Contenedor=3
            desactivado=false
            textoLabel=textos[2]
            ocultar=true
            ciclo_escolar=cicloGuardado
        case 5:
            if cicloGuardado == "" {
                ocultar=false
                guardandoLabel="Por favor escriba el ciclo escolar actual."
                enfocado=true
                funcion-=1
            } else {
                ocultar=false
                ciclo_escolar=cicloGuardado
                textoLabel=""
                guardandoLabel="¡Listo!, guardamos el ciclo escolar "+ciclo_escolar
                desactivado=true
            }
        case 6:
            Contenedor=0
            textoLabel=textos[3]
            ocultar=true
        case 7:
            desactivado=false
            Contenedor=5
            textoLabel=""
            ocultar=true
        case 8:
            var preescolarString: String=""
            var primariaString: String=""
            var secundariaString: String=""
            var bachilleratoString: String=""
            
            if preescolar == false && primaria == false && secundaria == false && bachillerato == false {
                enfocado=true
                ocultar=false
                funcion-=1
                guardandoLabel="Debes seleccionar al menos una sección"
            } else {
                if preescolar == true {
                    preescolarString="Preescolar"
                }
                if primaria == true {
                    primariaString="Primaria"
                }
                if secundaria == true {
                    secundariaString="Secundaria"
                }
                if bachillerato == true {
                    bachilleratoString="Bachillerato"
                }
                
                var seccionString: String=preescolarString + " " + primariaString + " " + secundariaString + " " + bachilleratoString
                ocultar=false
                guardandoLabel="Excelente. configuramos "+seccionString
                desactivado=true
            }
        case 9:
            Contenedor=7
            ocultar=true
            textoLabel=textos[4]
        case 10:
            desactivado=true
            ocultar=false
            guardandoLabel="Bien, ya hemos guardado tus montos"+inscripcionCostoPreescolar+colegiaturaCostoPreescolar+inscripcionCostoPrimaria+colegiaturaCostoPrimaria+inscripcionCostoSecundaria+colegiaturaCostoSecundaria+inscripcionCostoBachillerato+colegiaturaCostoBachillerato
        default:
            textoLabel=""
            ocultar=true
        }
        
        /*if funcion >= 2 {
            textoLabel=textos[1]
            ocultar=false
        }*/
        
        //retorna al view valores trabajados en la función
        return VStack {
            Text(textoLabel)
        }
    }
}

#Preview {
    ContentView()
}

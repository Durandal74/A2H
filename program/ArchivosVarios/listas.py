import os

class listas():
    def __init__(self):
        self.mensaje = 'Clase1'

    def listarTiposJuego(self, ruta):
        #ruta = "../roms"
        tiposJuegos = []
        filterTipo = []
        try:
            with os.scandir(ruta) as directorio:
                for elemento in directorio:
                    # Agregar el nombre del elemento a la lista
                    subLista = os.scandir(ruta + '/' + elemento.name)
                    subListaJuegos = []
                    for juego in subLista:
                        subListaJuegos.append(juego.name)
                    listaJuegos = (elemento.name, subListaJuegos)
                    tiposJuegos.append(listaJuegos)
                    filterTipo.append(elemento.name)
        except FileNotFoundError:
            print(f"La carpeta {ruta} no existe.")
        except PermissionError:
            print(f"No tienes permisos para acceder a la carpeta {ruta}.")
        except Exception as e:
            print(f"Error al listar elementos: {e}")
        return tiposJuegos, filterTipo



# testList = listas()

# rutaTipos = "C:\\Users\\LuisR\\OneDrive\\Documents\\GitHub\\A2H\\roms"
# ListaTiposJuego, filterTipos = testList.listarTiposJuego(rutaTipos)

# print("Elementos en la carpeta:")
# for elemento in ListaTiposJuego:
#     dato1, dato2 = elemento
#     print(dato1 + '-------')
#     for juegos in dato2:
#         print(juegos)
        
# for item in filterTipos:
#     print(item)
//
//  ListaPerritosTableViewController.swift
//  TabularEstatico
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 2/18/19.
//  Copyright © 2019 Ayax Alexis. All rights reserved.
//

import UIKit

//Paso 1: Agregar el protocolo UISearchResultsUpdating
class ListaPerritosTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    
    let perritosStringURL = "http://martinmolina.com.mx/201911/data/datosPerritos.json"
    private let perritos = ["Pug", "Labrador", "Pastor","Gran Danés", "French Poodle", "San Bernardo"];
    let perritosJSON = "[{\"raza\":\"pug\",\"edad\":\"2\"},{\"raza\":\"San Bernardo\",\"edad\":\"1\"},{\"raza\":\"chihuahua\",\"edad\":\"3\"}]"
    var perritosObj:[Any]?
    
    //Paso 2: Crear una variable paara almacenar datos que son filtrados
    var datosFiltrados = [Any]()
    
    //Paso 3: Crear un control de búsqueda
    let searchController = UISearchController(searchResultsController: nil)
    
    //Pso 4: Crear la funciçon updateSearchResults para cumplir con el protocolo
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text! == "" {
            datosFiltrados = perritosObj!
            //datos Filtrados = perritosOBJ!
        }else{
            //Filtrar los resultados de acuerdo al texto escrito en la caja qie es obtenido a travéz de los parámetros
            datosFiltrados = perritosObj!.filter{
                let objetoMarca=$0 as! [String:Any]
                let s:String = objetoMarca["marca"] as! String
                //Compara los datos en minúsculas en la tabla con lo ingresado en la searchBar por el ususario en minúsculas
                return(s.lowercased().contains(searchController.searchBar.text!))
            }
        }
        self.tableView.reloadData()
    }
    
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let perritosURL = URL(string: perritosStringURL);
        let data = try? Data(contentsOf: perritosURL!)
        perritosObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [AnyObject]
        //Paso 5: Copiar el contenido del arreglo en el arreglo filtrado
        datosFiltrados = perritosObj!
        
        //Paso 6: Usar la vista actual para representar los resultados de la búsqueda
        searchController.searchResultsUpdater = self
        
        //Paso 7: Controlar el background de los datos al momento de hacer la búsqueda
        searchController.dimsBackgroundDuringPresentation = false
        
        //Paso 8: Manejar la barra de navegación durante la búsqueda
        searchController.hidesNavigationBarDuringPresentation = false
        
        //Paso 9: Definir el contexto de la búsqueda
        self.definesPresentationContext = true
        
        //Paso 10: Instalar la barra de búsquead en cabecera de la tabla
        tableView.tableHeaderView = searchController.searchBar
        
        //El re-uso de las celdas se puede realizar de manera programática a travéz del registro
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return perritosObj!.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Zelda", for: indexPath)

        // Configure the cell...
        let objetoPerrito = perritosObj![indexPath.row] as! [String:Any];
        let raza:String = objetoPerrito ["raza"] as! String
        cell.textLabel?.text = raza
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Paso 12: Rempplazar el uso de perritosObj por datosFiltrados
        let siguiente = segue.destination as! DetallePerritoViewController;
        let indice = self.tableView.indexPathForSelectedRow?.row
        let objetoPerrito = datosFiltrados[indice!] as! [String:Any];
        let raza:String = objetoPerrito ["raza"] as! String
        siguiente.razaRecibida = raza
    }
    

}

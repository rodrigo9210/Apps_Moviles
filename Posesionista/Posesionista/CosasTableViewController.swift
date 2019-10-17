//
//  CosasTableViewController.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/9/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class CosasTableViewController: UITableViewController {

    let miInventario = Inventario()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return self.miInventario.todasLasCosas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cosaCell", for: indexPath) as! CosaTableViewCell
        let item = self.miInventario.todasLasCosas[indexPath.row]
        // Configure the cell...
        cell.labelDeNombre.text = item.nombre
        cell.labelDePrecio.text = "$\(item.valorEnPesos)"
        cell.labelDeSerie.text = item.numeroDeSerie
//        cell.textLabel?.text = item.nombre
//        cell.detailTextLabel?.text = "$\(item.valorEnPesos)"
        
        return cell
    }
    
    
    @IBAction func cambiaModoDeEdicion(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Editar", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Listo", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    
    @IBAction func añadeCosa(_ sender: UIButton) {
        let nuevaCosa = miInventario.creaCosa()
        let indiceDeNuevaCosa = miInventario.todasLasCosas.firstIndex(of: nuevaCosa)!
        //let ultimaFila = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: indiceDeNuevaCosa, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let cosaABorrar = miInventario.todasLasCosas[indexPath.row]
            miInventario.eliminaCosa(cosaAELiminar: cosaABorrar)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        miInventario.reordena(de: fromIndexPath.row, hacia: to.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MuestraDetalle" {
            if let filaSeleccionada = tableView.indexPathForSelectedRow {
                let detalleVC = segue.destination as! DetalleViewController
                detalleVC.cosaADetallar = miInventario.todasLasCosas[filaSeleccionada.row]
            }
        }
    }
    

}

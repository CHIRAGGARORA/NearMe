//
//  PlacesTableViewController.swift
//  NearMe
//
//  Created by chirag arora on 24/01/23.
//

import Foundation
import UIKit
import MapKit

class PlacesTableViewController: UITableViewController {
    
    var userLocation: CLLocation
    var places: [PlaceAnnotation]
    
    
    init(userLocation: CLLocation, places: [PlaceAnnotation]) {
        self.userLocation = userLocation
        self.places = places
        super.init(nibName: nil, bundle: nil)
        
        
        // register cell
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlaceCell")
        // all cells in tableview are recycled
        // scrolling of table view is very fast
        self.places.swapAt(indexForSelecxtedRow ?? 0, 0)
        
        
    }
    
    private var indexForSelecxtedRow: Int? {
        
        self.places.firstIndex(where: { $0.isSelected == true })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    private func calculateDistance(from: CLLocation, to: CLLocation) -> CLLocationDistance {
        from.distance(from: to)
        
    }
    
    private func formatDistanceForDisplay(_ distance: CLLocationDistance) -> String {
        let meters = Measurement(value: distance, unit: UnitLength.meters)
        return meters .converted(to: .miles).formatted()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath)
        let place = places[indexPath.row]
        
        
        // cell configuration (what kind of data cell will display)
        
        var content = cell.defaultContentConfiguration()
        content.text = place.name
        content.secondaryText = formatDistanceForDisplay(calculateDistance(from: userLocation, to: place.location)) 
        
        cell.contentConfiguration = content
        cell.backgroundColor = place.isSelected ? UIColor.lightGray: UIColor.clear
        
        return cell
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

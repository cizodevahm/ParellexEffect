//
//  ViewController.swift
//  ParellexEffect
//
//  Created by Jignesh Solanki on 09/10/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    
    @IBOutlet weak var tblParallex: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        tblParallex.register(UINib(nibName: "ParallaxCell", bundle: nil), forCellReuseIdentifier: "ParallaxCell")
    
      
        tblParallex.reloadData()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        tblParallex.isPagingEnabled = false
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        ParallaxViewUpdate()
    }
    
   
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
      
    }

    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell  = tblParallex.dequeueReusableCell(withIdentifier: "ParallaxCell", for: indexPath) as! ParallaxCell
            cell.selectionStyle = .none
            cell.backgroundColor = .red
            cell.lblNumber.text = String(format: "00%d", indexPath.row + 1)
            cell.imgViewBG.image = UIImage(named: String(format: "0%d", indexPath.row))
            return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return self.view.frame.size.height
        
    }
  
}
extension ViewController {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
    }
}
// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        ParallaxViewUpdate()
       
    }
    func scrollingFinished(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollingFinished(scrollView: scrollView)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            return
        }
        scrollingFinished(scrollView: scrollView)
    }
   
}
extension ViewController: UITableViewDelegate {
    
  
    //MARK: -ImageChanges
    private func ParallaxViewUpdate() {
        for MainCell in tblParallex.visibleCells
        {
         
            if let cell = MainCell as? ParallaxCell
            {
                ParallaxEffects(cell)
            }

        }
    }
    
    private func ParallaxEffects(_ cell: ParallaxCell) {
        let indexpath :NSIndexPath? = self.tblParallex.indexPath(for: cell) as NSIndexPath?
        let index = indexpath?.row
        let point = view.convert(cell.contentView.frame.origin, from: cell.contentView)
        cell.ImgTopConstraint.constant =  -(point.y / 4.0)
        cell.lblNumberTopConstraint.constant =  -(point.y / 4.0) + 144
    }
}

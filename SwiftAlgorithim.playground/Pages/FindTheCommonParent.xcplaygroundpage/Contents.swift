import UIKit

/*
                a
        b               c

    d      e     f              g


h
*/

// Find the common parent and hide it.


func hideCommonParent(_ firstView: UIView, _ secondView: UIView) {

    var referenceView: UIView? = firstView
    // unique views
    var viewContainer = Set<UIView>()

    while referenceView != nil { // Bottom up traversal
        viewContainer.insert(referenceView!)
        if let parentView = referenceView?.superview {
            referenceView = parentView
        } else {
            referenceView = nil
        }
    }

    referenceView = secondView
    while  referenceView != nil {
        if let rv = referenceView, viewContainer.contains(rv) {
            // found a view to hide
            print(rv.accessibilityLabel ?? "no identifier")
            rv.isHidden = true
            break
        } else {
            viewContainer.insert(referenceView!)
            if let parentView = referenceView?.superview {
                referenceView = parentView
            } else {
                referenceView = nil
            }
        }
    }
}



let a = UIView() // root
a.accessibilityLabel = "a"

let h = UIView()
h.accessibilityLabel = "h"

let e = UIView()
e.accessibilityLabel = "e"

let f = UIView()
f.accessibilityLabel = "f"

let g = UIView()
g.accessibilityLabel = "g"

let d = UIView()
d.accessibilityLabel = "d"

d.addSubview(h)

let b = UIView()
b.accessibilityLabel = "b"

b.addSubview(d)
b.addSubview(e)

let c = UIView()
c.accessibilityLabel = "c"

c.addSubview(f)
c.addSubview(g)

a.addSubview(b)
a.addSubview(c)

hideCommonParent(d, e)





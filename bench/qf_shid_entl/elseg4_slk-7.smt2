(set-logic QF_SHID)

(set-info :source |  Sleek solver
  http://loris-7.ddns.comp.nus.edu.sg/~project/s2/beta/
|)

(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)

; Sorts for locations, one by cell sort
(declare-sort Refnode 0)

; Types of cells in the heap

(declare-datatypes (
	(node 0)
	) (
	((c_node (nxt Refnode) ))
	)
)

; Type of heap

(declare-heap (Refnode node) 
)
; User defined predicates
(define-funs-rec (
	(elseg ((in Refnode)(p Refnode)) Bool
	)

	(right ((in Refnode)(p Refnode)) Bool
	)
		)
		((or 
		(and 
			(= in p)
			(_ emp Refnode node)
		)

	(exists ((a Refnode)(b Refnode))
	 
		(sep 
			(pto in (c_node a ))
			(pto a (c_node b ))
			(elseg b p )
		)

		)

	)
	(exists ((u Refnode))
	 
		(sep 
			(elseg in u )
			(elseg u p )
		)

		)

		)
)


(check-unsat) 
;; variables
(declare-const x Refnode)
(declare-const q Refnode)
(declare-const z Refnode)
(declare-const p Refnode)

(assert 
		(sep 
			(pto z (c_node x ))
			(elseg x q )
			(pto q (c_node p ))
		)

)

(assert (not 
			(right z p )
))

(check-unsat)

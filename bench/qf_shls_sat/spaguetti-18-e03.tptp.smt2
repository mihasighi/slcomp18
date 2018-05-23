(set-logic QF_SHLS)

(set-info :source |
A. Rybalchenko and J. A. Navarro Perez.
[Separation Logic + Superposition Calculus = Heap Theorem Prover]
[PLDI 2011]
http://navarroj.com/research/papers.html#pldi11
|)
(set-info :smt-lib-version 2.0)
(set-info :category "random") 
(set-info :status sat)
(set-info :version "2014-05-28")

; Sorts for locations, one by cell sort
(declare-sort RefSll_t 0)

; Types of cells in the heap

(declare-datatypes (
	(Sll_t 0)
	) (
	((c_Sll_t (next RefSll_t) ))
	)
)

; Type of heap

(declare-heap (RefSll_t Sll_t) 
)

(define-fun-rec ls ((in RefSll_t)(out RefSll_t)) Bool
	(or 
		(and 
			(= in out)
			(_ emp RefSll_t Sll_t)
		)

		(exists ((u RefSll_t))
	 
		(and 
			(distinct in out)
		(sep 
			(pto in (c_Sll_t u ))
			(ls u out )
		)

		)

		)

	)
)


(check-unsat) 
;; variables
(declare-const x0 RefSll_t)
(declare-const x1 RefSll_t)
(declare-const x2 RefSll_t)
(declare-const x3 RefSll_t)
(declare-const x4 RefSll_t)
(declare-const x5 RefSll_t)
(declare-const x6 RefSll_t)
(declare-const x7 RefSll_t)
(declare-const x8 RefSll_t)
(declare-const x9 RefSll_t)
(declare-const x10 RefSll_t)
(declare-const x11 RefSll_t)
(declare-const x12 RefSll_t)
(declare-const x13 RefSll_t)
(declare-const x14 RefSll_t)
(declare-const x15 RefSll_t)
(declare-const x16 RefSll_t)
(declare-const x17 RefSll_t)
(declare-const x18 RefSll_t)
(declare-const x19 RefSll_t)
(declare-const x20 RefSll_t)
(declare-const x21 RefSll_t)
(declare-const x22 RefSll_t)

(assert 
		(and 
			(= (as nil RefSll_t) (as nil RefSll_t))
			(distinct x6 x7)
			(distinct x6 x15)
			(distinct x11 x12)
			(distinct x11 x14)
			(distinct x11 x15)
			(distinct x3 x4)
			(distinct x3 x18)
			(distinct x3 x16)
			(distinct x3 x17)
			(distinct x7 x9)
			(distinct x9 x11)
			(distinct x9 x18)
			(distinct x9 x10)
			(distinct x2 x11)
			(distinct x2 x7)
			(distinct x2 x16)
			(distinct x2 x5)
			(distinct x15 x16)
			(distinct x8 x18)
			(distinct x8 x17)
			(distinct x1 x8)
			(distinct x1 x3)
			(distinct x1 x7)
			(distinct x1 x17)
			(distinct x1 x5)
			(distinct x1 x14)
			(distinct x4 x9)
			(distinct x4 x12)
			(distinct x13 x15)
			(distinct x10 x12)
			(distinct x16 x17)
			(distinct x5 x16)
			(distinct x5 x10)
		(sep 
			(ls x13 x15 )
			(ls x16 x11 )
			(ls x8 x10 )
			(ls x14 x9 )
			(ls x15 x3 )
			(ls x9 x6 )
		)

		)

)

(check-sat)

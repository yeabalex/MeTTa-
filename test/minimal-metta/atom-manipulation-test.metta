;count-atoms
!(count-atoms (A B C))        ; expected 3
!(count-atoms ())             ; expected 0

;map-expr
(: to-X (-> $t Atom))
(= (to-X $x) X)
!(map-expr to-X (A B C))      ; expected (X X X)

;filter
(= (keep-A $x) (if (== $x A) $x ()))
!(filter keep-A (A B A C))    ; expected (A A)

;contains
!(contains B (A B C))         ; expected True
!(contains Z (A B C))         ; expected ()

;reverse
!(reverse (A B C))            ; expected (C B A)
!(reverse ())                  ; expected ()

;concat
!(concat () (A B) (C D))      ; expected (A B C D)
!(concat () (A) ())            ; expected (A)
!(concat () () ())             ; expected ()

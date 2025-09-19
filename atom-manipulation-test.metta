! (import! &atoms ../src/atom-manipulation)


; Test: count-atoms 
! (match &atoms
         (= (count-atoms (A B C)) $res)
         $res)

! (match &atoms
         (= (count-atoms ()) $res)
         $res)


;  Test: map-expr 
(: to-X (-> $t Atom))
(= (to-X $x) X)

! (match &atoms
         (= (map-expr to-X (A B C)) $res)
         $res)


;  Test: filter 
(= (keep-A $x) (if (== $x A) $x ()))

! (match &atoms
         (= (filter keep-A (A B A C)) $res)
         $res)


;  Test: replace-subexpr 
;! (match &atoms
;         (= (replace-subexpr (A B (C D) B) B X) $res)
;         $res)


;  Test: contains 
! (match &atoms
         (= (contains B (A B C)) $res)
         $res)

! (match &atoms
         (= (contains Z (A B C)) $res)
         $res)


;  Test: reverse 
! (match &atoms
         (= (reverse (A B C)) $res)
         $res)


;  Test: concat 
! (match &atoms
         (= (concat () (A B) (C D)) $res)
         $res)

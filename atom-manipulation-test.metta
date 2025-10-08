! (import! &atoms ../src/atom-manipulation)

; Test: count-atoms 
! (= (count-atoms (A B C)) $res)
! $res

! (= (count-atoms ()) $res)
! $res


; Test: map-expr 
(: to-X (-> $t Atom))
(= (to-X $x) X)

! (= (map-expr to-X (A B C)) $res)
! $res


; Test: filter 
(= (keep-A $x) (if (== $x A) $x ()))

! (= (filter keep-A (A B A C)) $res)
! $res


; Test: replace-subexpr 
;! (= (replace-subexpr (A B (C D) B) B X) $res)
;! $res


; Test: contains 
! (= (contains B (A B C)) $res)
! $res

! (= (contains Z (A B C)) $res)
! $res


; Test: reverse 
! (= (reverse (A B C)) $res)
! $res


; Test: concat 
! (= (concat () (A B) (C D)) $res)
! $res

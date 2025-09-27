;length
!(length (Cons 1 (Cons 2 (Cons 3 Nil))))   ; expected 3
!(length Nil)                              ; expected 0

;foldl (sum)
(= (add $a $b) (+ $a $b))
!(foldl add 0 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; expected 6

;map
(= (inc $x) (+ $x 1))
!(map inc (Cons 1 (Cons 2 (Cons 3 Nil))))      ; expected (Cons 2 (Cons 3 (Cons 4 Nil)))

;head
!(head (Cons 1 (Cons 2 (Cons 3 Nil))))       ; expected 1
!(head Nil)                                  ; expected Nil

;tail
!(tail (Cons 1 (Cons 2 (Cons 3 Nil))))       ; expected (Cons 2 (Cons 3 Nil))
!(tail Nil)                                  ; expected Nil

;append
!(append 4 (Cons 1 (Cons 2 (Cons 3 Nil))))  ; expected (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))
!(append 1 Nil)                              ; expected (Cons 1 Nil)

;filter
(= (gt1 $x) (> $x 1))
!(filter gt1 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; expected (Cons 2 (Cons 3 Nil))
!(filter gt1 Nil)                            ; expected Nil

;contains
!(contains 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; expected True
!(contains 5 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; expected False
!(contains 1 Nil)                            ; expected False

;reverse
!(reverse (Cons 1 (Cons 2 (Cons 3 Nil))))    ; expected (Cons 3 (Cons 2 (Cons 1 Nil)))
!(reverse Nil)                               ; expected Nil

;length
(= (length Nil) 0)
(= (length (Cons $a $b)) 
    (+ 1 (length $b)))

;! (length (Cons A (Cons B (Cons C Nil))))

;map
(= (map $f Nil) 0)
(= (map $f (Cons $a $b))
    (Cons ($f $a) (map $f $b)))

(= (square $x) (* $x $x))

;!(map square (Cons 1 (Cons 2 (Cons 3 Nil))))

;foldl
(= (foldl $f $acc Nil) $acc)
(= (foldl $f $acc (Cons $a $b))
    (foldl $f ($f $acc $a) $b))
;!(foldl + 0 (Cons 1 (Cons 2 (Cons 3 Nil))))

;foldr
(= (foldr $f Nil $acc) $acc)
(= (foldr $f (Cons $x $xs) $acc)
   ($f $x (foldr $f $xs $acc)))
;! (foldr - (Cons 1 (Cons 2 (Cons 3 Nil))) 0) 


;reverse 
(= (reverse-helper Nil $acc) $acc)
(= (reverse-helper (Cons $a $b) $acc)
    (reverse-helper $b (Cons $a $acc)))
(= (reverse $a) (reverse-helper $a Nil))

!(reverse (Cons 1 (Cons 2 (Cons 3 Nil))))



;;------------------------------------------
; check if x is found in a list
(= (found $x Nil) False)
(= (found $x (Cons $a $b))
   (if (== $x $a)
       True
       (found $x $b)))


(= (unique-list-helper $seen Nil) Nil)
(= (unique-list-helper $seen (Cons $a $b))
   (if (found $a $seen)
       (unique-list-helper $seen $b)
       (Cons $a (unique-list-helper (Cons $a $seen) $b))))

; wrapper
(= (unique-list $xs)
   (unique-list-helper Nil $xs))


!(unique-list (Cons A (Cons B (Cons A (Cons C (Cons B Nil))))))

;;-----------------------------------------------------------------



;Take N elements
(= (take $n Nil) Nil)
(= (take $n (Cons $a $b))
   (if (> $n 0)
       (Cons $a (take (- $n 1) $b))
       Nil))
! (take 2 (Cons A (Cons B (Cons C (Cons D Nil))))) 


;Concat
(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys)
   (Cons $x (append $xs $ys)))


;lastelement

(= (lastelem Nil) Nil)
(= (lastelem (Cons $a Nil)) $a)
(= (lastelem (Cons $a $b))
    (lastelem $b))
! (lastelem (Cons A (Cons B (Cons C Nil))))

;head
(= (head Nil) Nil)
(= (head (Cons $a $b)) $a)
;! (head (Cons A (Cons B (Cons C Nil))))

;tail
(= (tail Nil) Nil)
(= (tail (Cons $a $b)) $b)
;! (tail (Cons A (Cons B (Cons C Nil))))

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
(= (sum $acc $x) (+ $acc $x))
;!(foldl sum 0 (Cons 1 (Cons 2 (Cons 3 Nil))))

;foldr
(= (foldr $f Nil $acc) $acc)
(= (foldr $f (Cons $x $xs) $acc)
   ($f $x (foldr $f $xs $acc)))

(= (subtract $x $y) (- $x $y))
;! (foldr subtract (Cons 1 (Cons 2 (Cons 3 Nil))) 0) 


;reverse 
(= (reverse-helper Nil $acc) $acc)
(= (reverse-helper (Cons $a $b) $acc)
    (reverse-helper $b (Cons $a $acc)))
(= (reverse $a) (reverse-helper $a Nil))

!(reverse (Cons 1 (Cons 2 (Cons 3 Nil))))

;unique
(= (found $x Nil) False)
(= (found $x (Cons $a $b))
   (if (== $x $a)
       True
       (found $x $b)))

; unique list
(= (unique Nil) Nil)
(= (unique (Cons $a $b))
   (if (found $a $b)
       (unique $b)
       (Cons $a (unique $b))))

!(unique (Cons A (Cons B (Cons A (Cons C (Cons B Nil))))))


;Take N elements
(= (take 0 $b) Nil)
(= (take $n Nil) Nil)
(= (take $n (Cons $a $b))
    (Cons $a (take (- $n 1) $b)))

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


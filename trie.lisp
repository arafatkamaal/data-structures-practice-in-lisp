

;;(a p p l e)
;;((a (p (p (l (e) (s))))) (b) (c) (d) (e) (f))

(defparameter *trie*
   '((a)
     (b)
     (c)
     (d)
     (e)
     (f)
     (g)
     (h)
     (i)
     (j)
     (k)
     (l)
     (m)
     (n)
     (o)
     (p)
     (q)
     (r)
     (s)
     (t)
     (u)
     (v)
     (w)
     (x)
     (y)
     (z)))

(car '((a) (b) (c)))
(nth 0 '((a) (b) (c)))
(car '((a (p)) (b) (c)))
(cdr (car '((a (p)) (b) (c))))
(car (cdr (car '((a (p)) (b) (c)))))
(car (car (cdr (car '((a (p)) (b) (c))))))

(defun member? (lst m)
  (labels ((mem? (l m)
             (cond
               ((null l) nil)
               ((eq (car (car l)) m) (car l))
               (t (mem? (cdr l) m)))))
    (mem? (cdr lst) m)))

(member? '(a (p (p (l (e)) (s))) (n)) 'p)
(member? '(a (p (p (l (e)) (s))) (n)) 'n)
(member? '(a (p (p (l (e)) (s))) (n) (s (k))) 's)

(defun add-member (lst m)
  (labels ((add-mem (l m)
             (cond
               ((null l) (append lst (list (list m))))
               ((eq (car (car l)) m) (car l))
               (t (add-mem (cdr l) m)))))
    (add-mem (cdr lst) m)))

(add-member '(a (p (p (l (e)) (s))) (n) (s (k))) 'b)
(add-member '() 'a)
(add-member '(a) 'p)

(defun add-member-f (lst m)
  (labels ((add-mem (l m)
             (cond
               ((null l) (list (list m)))
               ((eq (car (car l)) m) '())
               (t (cons (car l) (add-mem (cdr l) m))))))
    ((cons (car lst) (add-mem (cdr lst) m)))))

(defun add-member-sub (lst mbr)
  (labels ((add-mem (l m)
             (cond
               ((null l)
                (if (null m)
                    '()
                    (list (list m))))
               ((eq (car (car l)) m) (add-mem l '()))
               (t (cons (car l) (add-mem (cdr l) m))))))
    (add-mem (cdr lst) mbr)))

(defun add-member-full (lst mbr)
  (cons (car lst) (add-member-sub lst mbr)))

(add-member-full '(a (p (p (l (e)) (s))) (n) (s (k))) 'b)
(add-member-full '(a (p (p (l (e)) (s))) (n) (s (k))) 'p)

(defun add-member-at-level (lst m levl)
  (if (eq 1 levl)
      (if (eq (car lst) m)
          (cons m '()))
      ))


(add-member-at-level '(a (p (p (l (e)) (s))) (n) (s (k))) 'p 3)

(defun get-matching-slist (m l)
  (cond
    ((null l) l)
    ((eq (car (car l)) m) (car l))
    (t (get-matching-slist m (cdr l)))))

(defun get-matching-slist (member lst)
  (let ((fl lst))
    (labels ((gms (m l)
               (cond
                 ((null l) fl)
                 ((eq (car (car l)) m) (car l))
                 (t (gms m (cdr l))))))
      (gms member lst))))

(get-matching-slist 'p '((p (p (l (e)) (s))) (n) (s (k))))
(get-matching-slist 'b '((p (p (l (e)) (s))) (n) (s (k))))

(car (car '((p (p (l (e)) (s))) (n) (s (k)))))
(car '((p (p (l (e)) (s))) (n) (s (k))))


(let ((lst '((p (p (l (e)) (s))) (n) (s (k))))
      (tl '(p p l y)))
  (labels ((add-mem (l t)
             (cond
               ((null t) l)
               ())))))


(defparameter *trie-small*
  '((a)
    (b)
    (c)))

(defun member? (m lst)
  (cond
    ((null lst) nil)
    ((eq m (car (car lst)))
     (car lst))
    (t (member? m (cdr lst)))))

(defun member? (m lst)
  (cond
    ((null lst) nil)
    ((atom (car lst))
     (if (eq (car lst) m)
         lst))
    ((eq m (car (car lst)))
     (car lst))
    (t (member? m (cdr lst)))))

(member? 'a '())
(member? 'b '((a)))
(member? 'p '(a))
(member? 'p '(a (p)))
(member? 'p '(p (p (l))))

(cons '() '((a)))


(defun straight-trie (seq tr)
  (let ((mbr (member? (car seq) tr))
        (elem (car seq))
        (lelem (list (list (car seq)))))
    (cond
      ((null seq)
       mbr)
      ((eq nil mbr)
       (cons elem (list (straight-trie (cdr seq) (cdr mbr)))))
      (t (cons (car mbr) (list (straight-trie (cdr seq) (cdr mbr))))))))

(defun merge-trie (ftr str)
  (cond
    ((null ftr) str)
    ((null str) ftr)
    ((eq (car ftr) (car str))
     (cons (car ftr) (list (merge-trie (car (cdr ftr)) (car (cdr str))))))
    (t (append ftr (list str)))))

(merge-trie (straight-trie '(a p p l e s e e d) '((a) (b) (c)))
            (merge-trie (straight-trie '(a p p l e) '((a) (b) (c)))
                        (straight-trie '(a p p s t a n d) '((a) (b) (c)))))

(straight-trie '(a p p l e) '((a) (b) (c)))
(straight-trie '(a p p s t a n d) '((a (p (p (l (e))))) (b) (c)))


(defun sub-trie (seq tr)
  (let ((mbr (member? (car seq) tr))
        (elem (car seq))
        (lelem (list (car seq))))
    (cond
      ((null seq)
       '())
      ((eq nil mbr)
       (cons (cons elem (sub-trie (cdr seq) (cdr mbr))) tr))
      (t (cons (car mbr) (list (sub-trie (cdr seq) (cdr mbr))))))))


(sub-trie '(b a n d a g e) '((a (p (p (l (e))))) (b) (c)))
(sub-trie '(a p p l e) '((a) (b) (c)))
(sub-trie '(a p p s) '((a (p (p (l (e))))) (b) (c)))


(cdr '(a (b (c (d e)))))
(+ 1 (+ 1 (+ 1 0)))

(append '(l) (append '((e)) '()))
(append (append '(l) (append '((e)) '())) (append '((s)) '()))

(defparameter init-tree
   '((a) (b) (c) (d) (e) (f) (g) (h) (i)
     (j) (k) (l) (m) (n) (o) (p) (q) (r)
     (s) (t) (u) (v) (w) (x) (y) (z)))

(defun member? (m lst)
  (cond
    ((null lst) nil)
    ((atom (car lst))
     (if (eq (car lst) m)
         lst))
    ((eq m (car (car lst)))
     (car lst))
    (t (member? m (cdr lst)))))

(defun sub-trie (seq tr)
  (let ((mbr (member? (car seq) tr))
        (elem (car seq))
        (lelem (list (car seq))))
    (cond
      ((null seq)
       '())
      ((eq nil mbr)
       (append (car tr) (cons elem (list (sub-trie (cdr seq) (cdr mbr))))))
      (t (cons (car mbr) (list (sub-trie (cdr seq) (cdr mbr))))))))

(defun triefy (tr seq)
  (cond
    ((null tr) '())
    ((eq (car seq) (car (car tr)))
     (cons (sub-trie seq tr) (triefy (cdr tr) seq)))
    (t (cons (car tr) (triefy (cdr tr) seq)))))

(let ((trie '()))
  (setf trie (triefy init-tree '(a p p l e)))
  (setf trie (triefy trie '(a p p s)))
  trie)


(car (car init-tree))
(sub-trie '(a p p l e) init-tree)
(triefy init-tree '(a p p l e))
(triefy '(a p p s))
(triefy '(b a n d a g e))
(triefy '(b a n d a i d))

(sub-trie '(a p p l e) *trie*)

*trie*

(cons '(c (d)) '((e)))

(sub-trie '(a p p l e) '((a) (b) (c)))
(sub-trie '(a p p s) '((a (p (p (l (e))))) (b) (c)))
(sub-trie '(b a n d a g e) '((a (p (p (l (e))))) (b) (c)))


(append '((a)) 'b)   ;; ((A) . B)
(append '(a) '(b))   ;; (A B)
(cons '(a) 'b)       ;; ((A) . B)
(cons '(a) '(b))     ;; ((A) B)
(cons '(A) '((B)))   ;; ((A) (B))
(append '(a) '((b))) ;; (A (B))
;;;;;; Restart writing this code

(defparameter init-tree
   '((a) (b) (c) (d) (e) (f) (g) (h) (i)
     (j) (k) (l) (m) (n) (o) (p) (q) (r)
     (s) (t) (u) (v) (w) (x) (y) (z)))

(defun member? (m lst)
  (cond
    ((null lst) nil)
    ((atom (car lst))
     (if (eq (car lst) m)
         lst))
    ((eq m (car (car lst)))
     (car lst))
    (t (member? m (cdr lst)))))

;;'a (a)   => (a)
;;'p (p) => (p)
;;'p (p (p (l (e)))) => (p (p (l (e)))
;;'s (p (p (l (e)))) => (p (p (l (e)))) (s))
;;'p (a)     => (p)
(defun add-member (m lst)
  (cond
    ((null lst)
     (list m))
    ((eq (car (car (cdr lst)) m)
         lst))
    (t )))

(defun add-member (m seq)
  (labels ((am (m lst acc found)
             (cond
               ((null lst)
                (if (null found)
                    (append (list (list m)) acc)
                    (append (list found) acc)))
               ((eq (car (car (cdr lst))) m)
                (am m (cdr (cdr lst)) acc (car (cdr lst))))
               (t (if (null acc)
                      (am m (cdr (cdr lst)) (list (car (cdr lst))) found)
                      (am m (cdr (cdr lst)) (append (list (car (cdr lst))) (list acc)) found))))))
    (am m seq '() '())))

;;
(defun add-member (m seq)
  (labels ((am (m lst acc found)
             (cond
               ((null lst)
                (if (null found)
                    (if (null acc)
                        (append (list (list m)) '())
                        (append (list (list m)) acc))
                    (append (list found) acc)))
               ((eq (car (car (cdr lst))) m)
                (am m (cdr (cdr lst)) acc (car (cdr lst))))
               (t (if (null acc)
                      (if (eq nil (car (cdr lst)))
                          (am m (cdr (cdr lst)) '() found)
                          (am m (cdr (cdr lst)) (list (car (cdr lst))) found))
                      (am m (cdr (cdr lst)) (append (list (car (cdr lst))) (list acc)) found))))))
    (am m seq '() '())))

(null '())
(append '((m)) '())
(list (car (cdr '(a))))
(add-member 'a '())
(add-member 'a '(a))
(add-member 'p '(a (p (p (l (e))))))
(add-member 'a '(a (b (c (d)))))
(add-member 'p '(a))
(add-member 'p '(p (p (l (e)))))
(add-member 's '(p (l (e))))
(add-member 'p '(a (p (p (l (e))))))
(add-member 'p '(p (p (l (e)))))
(add-member 's '(p (l (e))))

  
(defun sub-trie (seq tr)
  (cond
    ((null seq) '())
    ((eq (length seq) 1)
     (cons (car tr) (add-member (car seq) tr)))
    (t (let ((st (add-member (car seq) tr)))
         (if (null (cdr st))
             (cons (car tr) (list (sub-trie (cdr seq) (car st))))
             (cons (car tr) (append (cdr st) (list (sub-trie (cdr seq) (car st))))))))))

(sub-trie '(p p l e) '(a))
(sub-trie '(p p s t a n d) '(a (p (p (l (e))))))
(sub-trie '(a p p s) '((a (p (p (l (e))))) (b) (c)))
(sub-trie '(b a n d a g e) '((a (p (p (l (e))))) (b) (c)))

(cons '(l (e)) '(s))

(append '(a) '((b)))
(null (cdr '(p)))

(cons 'a '((b) (c)))
(append '((b) (c)) '(a))

(append '((a)) '())
(car '())
(append '((a)) 'b)   ;; ((A) . B)
(append '(a) '(b))   ;; (A B)
(cons '(a) 'b)       ;; ((A) . B)
(cons '(a) '(b))     ;; ((A) B)
(cons '(A) '((B)))   ;; ((A) (B))
(append '(a) '((b))) ;; (A (B))
(append '(a (b)) '((c)))
(append '((a (z))) '((b (c)) (d)))


;;Working code

(defparameter init-tree
   '((a) (b) (c) (d) (e) (f) (g) (h) (i)
     (j) (k) (l) (m) (n) (o) (p) (q) (r)
     (s) (t) (u) (v) (w) (x) (y) (z)))

(defun add-member (m seq)
  (labels ((am (m lst acc found)
             (cond
               ((null lst)
                (if (null found)
                    (if (null acc)
                        (append (list (list m)) '())
                        (append (list (list m)) acc))
                    (append (list found) acc)))
               ((eq (car (car (cdr lst))) m)
                (am m (cdr (cdr lst)) acc (car (cdr lst))))
               (t (if (null acc)
                      (if (eq nil (car (cdr lst)))
                          (am m (cdr (cdr lst)) '() found)
                          (am m (cdr (cdr lst)) (list (car (cdr lst))) found))
                      (am m (cdr (cdr lst)) (append (list (car (cdr lst))) (list acc)) found))))))
    (am m seq '() '())))


(defun sub-trie (seq tr)
  (cond
    ((null seq) '())
    ((eq (length seq) 1)
     (cons (car tr) (add-member (car seq) tr)))
    (t (let ((st (add-member (car seq) tr)))
         (if (null (cdr st))
             (cons (car tr) (list (sub-trie (cdr seq) (car st))))
             (cons (car tr) (append (cdr st) (list (sub-trie (cdr seq) (car st))))))))))


(defun trie (seq)
  (labels ((bt (seq tr)
             (cond
               ((null tr) '())
               ((eq (car seq) (car (car tr)))
                (append (list (sub-trie (cdr seq) (car tr))) (bt seq (cdr tr))))
               (t (append (list (car tr)) (bt seq (cdr tr)))))))
    (setq init-tree (bt seq init-tree))))


(trie '(a p p l e))
(trie '(a p p l e s e e d))
(trie '(z e b r a))
(trie '(a p p o i n t m e n t))
(trie '(a r a f a t))

init-tree

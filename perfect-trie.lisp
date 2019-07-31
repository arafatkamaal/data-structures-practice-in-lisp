
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

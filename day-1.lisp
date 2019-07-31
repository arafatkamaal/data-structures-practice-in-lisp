


(defun is-present? (lst element)
  (cond
    ((null lst) nil)
    ((eq element (car lst)) t)
    (t (is-present? (cdr lst) element))))

(is-present? '(1 2 3 4 5) 100)
(is-present? '(1 2 3 4 5 6 7) 6)

(defun pair-adds-to-k? (lst k)
  (labels ((patk? (l k)
             (cond
               ((null l) nil)
               ((is-present? lst (- k (car l))) t)
               (t (patk? (cdr l) k)))))
    (patk? lst k)))

(pair-adds-to-k? '(10 15 3 7) 17)
(pair-adds-to-k? '(10 15 3 7) 100)

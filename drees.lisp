

(defstruct btree-node
  value
  position
  left-btree-node
  right-btree-node)

;;Simple test create a 3 node tree
(let ((n (make-btree-node :value 1
                          :position 'root
                          :left-btree-node (make-btree-node :value 2
                                                            :position 'left
                                                            :left-btree-node nil
                                                            :right-btree-node nil
                                                            )
                          :right-btree-node (make-btree-node :value 3
                                                             :position 'right
                                                             :left-btree-node nil
                                                             :right-btree-node nil))))
  n)


(cons '2 (cons '1 '()))
(append '(2) '(0 1))
(append '(0 1) '(2))

;;redefine btree-node
(defstruct btree-node
  value
  position)

;;make a list representation of btree
(defun make-3-element-btree (lst)
  (if (/= (length lst) 3)
      nil
      (let ((l '()))
        (progn
          (setf l (cons (make-btree-node :value (car lst)
                                         :position 'root) l))
          (setf l (append  l (list (make-btree-node :value (car (cdr lst))
                                                    :position 'left))))
          (setf l (append l (list (make-btree-node :value (car (cdr (cdr lst)))
                                                   :position 'right))))))))

(make-3-element-btree '(1 2 3))

;;(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
;;((1) (2 (4 (8) (9)) (5 (10) (11))) (3 (6 (12) (13)) (7 (14) (15))))

(defun make-3-element-list (lst)
  (list (nth 0 lst) (nth 1 lst) (nth 2 lst)))

(defun list-from-3-element (lst)
  (cdr (cdr (cdr lst))))

(make-3-element-list '(1 2 3 4))
(make-3-element-list '())

(list-from-3-element '(1 2 3 4))
(list-from-3-element '(1 2))
(make-3-element-list (list-from-3-element '(1 2)))

(defun make-left-elements (lst)
  (make-3-element-list lst))

(make-left-elements '(1 2))
(make-left-elements '(1 2 3 4))

(defun make-right-elements (lst)
  (make-3-element-list (list-from-3-element lst)))

(make-right-elements '(1 2))
(make-right-elements '(1 2 3 4))
(make-right-elements '(1 2 3 4 5 6 7))

(defun make-next-set (lst)
  (list-from-3-element (list-from-3-element lst)))

(make-next-set '(1 2 3 4 5 6 7))
(make-left-elements (make-next-set '(1 2 3 4 5 6 7)))

(defun make-left-nodes (lst)
  (make-3-element-btree (make-left-elements lst)))

(make-left-nodes '(1 2 3 4) 'left)

(defun make-3-element-btree (lst root-pos)
  (if (/= (length lst) 3)
      nil
      (let ((l '()))
        (progn
          (setf l (cons (make-btree-node :value (car lst)
                                         :position root-pos) l))
          (setf l (append  l (list (make-btree-node :value (car (cdr lst))
                                                    :position 'left))))
          (setf l (append l (list (make-btree-node :value (car (cdr (cdr lst)))
                                                   :position 'right))))
          (list (list (car l) (list (nth 1 l)) (list (nth 2 l))))))))


(defun make-right-nodes (lst)
  (make-3-element-btree (make-right-elements lst)))

(make-right-nodes '(1 2 3 4 5 6 7 8 9))

;;;Simple nodes
(defun make-3-element-btree (lst)
  (if (/= (length lst) 3)
      nil
      (list (car lst) (list (nth 1 lst)) (list (nth 2 lst)))))

;;tree      : (1)
;;children  : ((2) (3))
;;returns   : (1 (2) (3))
(defun set-children (tree left-tree)
  (cons (car tree) left-tree))

(set-children '(1) '((2) (3)))



(defun construct-simple-btree (lst)
  (let ((tree (make-3-element-btree (make-3-element-list lst)))
        (orig-l lst))
    (labels ((csb (tree sq)
               (let ((left-elements (make-3-elements)))))))))
    

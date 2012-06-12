(in-package :eu.tentacleriot.clquery)

(defun flatten (tree)
  (labels ((flat (node) (append (list node) (mapcan #'flat (eu.tentacleriot.mdom:get-children node))))) (flat tree)))

(defun filter-tag (tag lst)
  (if tag
      (remove-if-not (lambda (x) (string= (eu.tentacleriot.mdom:get-tag x) tag)) lst)
      lst))

(defun filter-id (id lst)
  (if id 
      (remove-if-not (lambda (x) (string= (car (eu.tentacleriot.mdom:get-attribute-values x "id")) id)) lst)
      lst))

(defun has-member (lst member)
  (reduce (lambda (x y) (or x y)) (mapcar (lambda (x) (string= member x)) lst)))

(defun split-space (str)
  (labels ((spl (str acc) (let ((pos (position #\space str)))
			    (if pos
				(spl (subseq str (+ 1 pos)) (append acc (list (subseq str 0 pos))))
				(append acc (list str))))))
    (spl str (list))))

(defun filter-class (class lst)
  (if class (remove-if-not (lambda (x) (let ((classes (eu.tentacleriot.mdom:get-attribute-values x "class")))
					  (if classes
					      (reduce (lambda (x y) (or x y)) 
						      (mapcar (lambda (x) (has-member x class)) 
							      (mapcar #'split-space classes)))
					      Nil)))
			   lst) 
      lst))
  

(defun filter (tree &key (tag nil) (id nil) (class nil))
  (filter-tag tag (filter-class class (filter-id id (flatten tree)))))
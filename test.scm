;;; insert new atom to right of list member

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons (car lat) (cons new (cdr lat))))
      (else 
        (cons (car lat) (insertR new old (cdr lat))))))) 

;;; insert new atom to left of list member

(define insertLB
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new lat))
      ((cons (car lat) (insertLB new old (cdr lat)))))))

;;; substitute new atom for first occ. of old

(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new (cdr lat)))
      ((cons (car lat) (subst new old (cdr lat)))))))

;;; more succint without lambda

(define (substA new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new (cdr lat)))
      ((cons (car lat) (substA new old (cdr lat))))))

;;; replace first occ. of o1 OR o2 with new

(define (substB new o1 o2 lat)
  (cond
    ((null? lat) (quote ()))
    ((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
    ((cons (car lat) (substB new o1 o2 (cdr lat))))))

;;; remove all occurrences of a from lat (use lambda)

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (multirember a (cdr lat)))
      ((cons (car lat) (multirember a (cdr lat)))))))

;;; insert atom to right of all occurrences of old (except end of list)

(define multiinsertRB
  (lambda (new old lat)
    (cond
      ((null? lat) (quote()))
      ;; 'and' to stop new appearing at end of list
      ((and (eq? (car lat) old) (not (null? (cdr lat)))) 
        (cons (car lat) (cons new (multiinsertRB new old (cdr lat)))))
      ((cons (car lat) (multiinsertRB new old (cdr lat)))))))

;;; insert atom to left of all occ. of old 

(define multiinsertL 
  (lambda (new old lat)
    (cond 
      ((null? lat) (quote ()))
      ((eq? (car lat) old) 
        (cons new (cons (car lat) (multiinsertL new old (cdr lat)))))
      ((cons (car lat) (multiinsertL new old (cdr lat)))))))

;;; substitute all occ. of ol
d with new

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) 
        (cons new (multisubst new old (cdr lat))))
      ((cons (car lat) (multisubst new old (cdr lat)))))))


;;; add function (add1 sub1 already defined)

(define plus
  (lambda (n m)
    (cond
      ((zero? m) n)
      

 













  

(define (convex-hull points)
  (let [max-y-index (max-by #(.y %) points)]
    (take-while #(not= (count %) 2)
               (iterate #(cons (first %)
                                (filter #(not= (count %) 2)
                                        (remove #(let [a (subvec % 0 (- (count %) 1))
                                                       b (subvec % 1 (- (count %) 2))]
                                                (<= 0 (cross a b)))
                                            (rest %)))))
               [max-y-index]))))

(define (cross a b)
  (* (first a) (second b))
  (- (second a) (first b))))

(main)

(defn convex-hull [points]
  (let [max-y-index (max-by #(.y %) points)]
    (take-while #(not= (count %) 2)
               (iterate #(cons (first %)
                                (filter #(not= (count %) 2)
                                        (remove #(let [a (subvec % 0 (- (count %) 1))
                                                       b (subvec % 1 (- (count %) 2))]
                                                (<= 0 (cross a b)))
                                            (rest %)))))
               [max-y-index]))))

(defn cross [a b]
  (* (first a) (second b))
  (- (second a) (first b))))

(defn main []
  (let [points (map #(read-string) (line-seq (clojure.java.io/reader *in*)))]
    (println (convex-hull points))))

(main)

;; Auto-generated. Do not edit!


(when (boundp 'hebi_cpp_api_examples::SaveWaypoint)
  (if (not (find-package "HEBI_CPP_API_EXAMPLES"))
    (make-package "HEBI_CPP_API_EXAMPLES"))
  (shadow 'SaveWaypoint (find-package "HEBI_CPP_API_EXAMPLES")))
(unless (find-package "HEBI_CPP_API_EXAMPLES::SAVEWAYPOINT")
  (make-package "HEBI_CPP_API_EXAMPLES::SAVEWAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude SaveWaypoint.msg.html


(defclass hebi_cpp_api_examples::SaveWaypoint
  :super ros::object
  :slots (_name ))

(defmethod hebi_cpp_api_examples::SaveWaypoint
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get hebi_cpp_api_examples::SaveWaypoint :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get hebi_cpp_api_examples::SaveWaypoint :datatype-) "hebi_cpp_api_examples/SaveWaypoint")
(setf (get hebi_cpp_api_examples::SaveWaypoint :definition-)
      "string name


")



(provide :hebi_cpp_api_examples/SaveWaypoint "c1f3d28f1b044c871e6eff2e9fc3c667")



;; Auto-generated. Do not edit!


(when (boundp 'hebi_motor::custom_msg)
  (if (not (find-package "HEBI_MOTOR"))
    (make-package "HEBI_MOTOR"))
  (shadow 'custom_msg (find-package "HEBI_MOTOR")))
(unless (find-package "HEBI_MOTOR::CUSTOM_MSG")
  (make-package "HEBI_MOTOR::CUSTOM_MSG"))

(in-package "ROS")
;;//! \htmlinclude custom_msg.msg.html


(defclass hebi_motor::custom_msg
  :super ros::object
  :slots (_num_float ))

(defmethod hebi_motor::custom_msg
  (:init
   (&key
    ((:num_float __num_float) 0.0)
    )
   (send-super :init)
   (setq _num_float (float __num_float))
   self)
  (:num_float
   (&optional __num_float)
   (if __num_float (setq _num_float __num_float)) _num_float)
  (:serialization-length
   ()
   (+
    ;; float64 _num_float
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _num_float
       (sys::poke _num_float (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _num_float
     (setq _num_float (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get hebi_motor::custom_msg :md5sum-) "b62cff7d3666b686e1901448794166aa")
(setf (get hebi_motor::custom_msg :datatype-) "hebi_motor/custom_msg")
(setf (get hebi_motor::custom_msg :definition-)
      "float64 num_float

")



(provide :hebi_motor/custom_msg "b62cff7d3666b686e1901448794166aa")



;; Auto-generated. Do not edit!


(when (boundp 'hebi_cpp_api_examples::ArmMotionFeedback)
  (if (not (find-package "HEBI_CPP_API_EXAMPLES"))
    (make-package "HEBI_CPP_API_EXAMPLES"))
  (shadow 'ArmMotionFeedback (find-package "HEBI_CPP_API_EXAMPLES")))
(unless (find-package "HEBI_CPP_API_EXAMPLES::ARMMOTIONFEEDBACK")
  (make-package "HEBI_CPP_API_EXAMPLES::ARMMOTIONFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude ArmMotionFeedback.msg.html


(defclass hebi_cpp_api_examples::ArmMotionFeedback
  :super ros::object
  :slots (_percent_complete ))

(defmethod hebi_cpp_api_examples::ArmMotionFeedback
  (:init
   (&key
    ((:percent_complete __percent_complete) 0.0)
    )
   (send-super :init)
   (setq _percent_complete (float __percent_complete))
   self)
  (:percent_complete
   (&optional __percent_complete)
   (if __percent_complete (setq _percent_complete __percent_complete)) _percent_complete)
  (:serialization-length
   ()
   (+
    ;; float64 _percent_complete
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _percent_complete
       (sys::poke _percent_complete (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _percent_complete
     (setq _percent_complete (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get hebi_cpp_api_examples::ArmMotionFeedback :md5sum-) "cc6abe8bc172f00995b2c3f53015f718")
(setf (get hebi_cpp_api_examples::ArmMotionFeedback :datatype-) "hebi_cpp_api_examples/ArmMotionFeedback")
(setf (get hebi_cpp_api_examples::ArmMotionFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
float64 percent_complete



")



(provide :hebi_cpp_api_examples/ArmMotionFeedback "cc6abe8bc172f00995b2c3f53015f718")



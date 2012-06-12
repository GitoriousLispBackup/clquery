(defpackage eu.tentacleriot.clquery
  (:use :common-lisp :eu.tentacleriot.mdom)
  (:export :filter
	   :parse
	   :to-xml
	   :get-attributes
	   :get-attribute-values
	   :get-elements-by-tag-name
	   :get-elements-by-id
	   :get-tag
	   :add-child
	   :get-children))

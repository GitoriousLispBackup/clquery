;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(defpackage #:clquery-asd
  (:use :cl :asdf))

(in-package :clquery-asd)

(defsystem clquery
  :name "eu.tentacleriot.clquery"
  :version "0.0"
  :maintainer "Michael Bauer <mihi@lo-res.org>"
  :author "Michael Bauer <mihi@lo-res.org>"
  :licence "BSD (see LICENSE for details)"
  :description "A jquery like filter set for dom trees"
  :long-description "A jquery like filter set for dom trees"
  :serial T
  :components ((:file "package")
	       (:file "clquery" :depends-on ("package")))
  :depends-on ("mdom"))

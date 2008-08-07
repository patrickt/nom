;; source files
(set @m_files     (filelist "^objc/.*\.m$"))
(set @nu_files 	  (filelist "^nu/.*nu$"))

;; framework description
(set @framework "Nom")
(set @framework_identifier   "nu.programming.nom")
(set @framework_creator_code "pthm")
(set @framework_initializer "NomNomNom")


(set @frameworks  '("Cocoa" "Nu"))
(set @ldflags " -framework Cocoa -framework Nu")
(set @includes    "")

(compilation-tasks)
(framework-tasks)

(task "default" => "framework")

(task "clobber" => "clean" is
      (SH "rm -rf #{@framework_dir}"))

(task "install" => "framework" is
      (SH "sudo rm -rf /Library/Frameworks/#{@framework}.framework")
      (SH "ditto #{@framework}.framework /Library/Frameworks/#{@framework}.framework"))

(task "test" => "framework" "nush" is
    (SH "nutest test/test_*.nu"))

;; source files
(set @m_files     (filelist "^objc/.*\.m$"))
(set @nu_files 	  (filelist "^nu/.*nu$"))

;; framework description
(set @framework "nom")
(set @framework_identifier   "nu.programming.nom")
(set @framework_creator_code "????")

(set @cflags "-g -DDARWIN")
(set @frameworks  '("Cocoa" "Nu"))
(set @ldflags " -framework Cocoa -framework Nu")

(compilation-tasks)
(framework-tasks)

(task "default" => "framework")

(task "clobber" => "clean" is
      (SH "rm -rf #{@framework_dir}"))

(task "install" => "framework" is
      (SH "sudo rm -rf /Library/Frameworks/#{@framework}.framework")
      (SH "ditto #{@framework}.framework /Library/Frameworks/#{@framework}.framework"))

(task "doc" is (SH "nudoc"))

(task "test" => "framework" "nush" is
    (SH "nutest test/test_*.nu"))

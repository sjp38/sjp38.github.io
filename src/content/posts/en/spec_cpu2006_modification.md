+++
title = "spec cpu2006 벤치마크 수정하기"
subtitle = ""
date = "2017-12-24T17:30:12+09:00"
bigimg = ""
tags = ["spec", "benchmark", "spec_cpu", "spec_cpu2006"]
categories = ["tip"]

+++

경우에 따라서 SPEC CPU2006 의 벤치마크 중 일부의 소스코드를 수정하고 싶을 수
있습니다.  예를 들어 특정 벤치마크가 구체적으로 어떻게 동작하는지 알아보기 위해
디버깅 메세지를 추가하고자 할수도 있고, 코드 변경을 통해 성능을 높인다거나 해볼
수도 있겠죠.  그러나, SPEC CPU2006 은 엄정한 벤치마크 수트이기 때문에
소스코드는 물론, 소스코드를 사용하는 도구가 변경된 경우 에러 메세지를 내고
수행을 거부합니다.  수정된 소스코드로 얻어진 결과는 벤치마크 결과로 적합하지
않기 때문이죠.

때문에, 어쩔 수 없이 수정이 필요하면서도 기존의 수행 방법을 따르려면 이 에러를
내는 곳을 없애는 게 한가지 방법이 될 수 있습니다.  다음의 패치를 적용하면
이 검증 코드가 사라져서 수정된 코드로도 벤치마크를 돌릴 수 있게 됩니다.

```
diff --git a/bin/formatter/setup_common.pl b/bin/formatter/setup_common.pl
index 36170cda1649..b21890972dbd 100755
--- a/bin/formatter/setup_common.pl
+++ b/bin/formatter/setup_common.pl
@@ -278,13 +278,13 @@ sub check_important_files {
     return if (   $::suite_version > 4
                && !$ENV{'SPEC_CHECK'});
     $::check_integrity = 1;
-    foreach my $important_file (jp('bin', basename($0)),
-                                grep { m/$re/ } keys %::file_md5) {
-        if (!check_files(\%::file_md5, $important_file)) {
-            print STDERR "\n\nPart of the tools ($important_file) is corrupt!\nAborting...\n\n";
-            exit 1;
-        }
-    }
+#    foreach my $important_file (jp('bin', basename($0)),
+#                                grep { m/$re/ } keys %::file_md5) {
+#        if (!check_files(\%::file_md5, $important_file)) {
+#            print STDERR "\n\n Part of the tools ($important_file) is corrupt!\nAborting...\n\n";
+#            exit 1;
+#        }
+#    }
 }
 
 1;
diff --git a/bin/setup_common.pl b/bin/setup_common.pl
index 36170cda1649..d9dbe214d498 100755
--- a/bin/setup_common.pl
+++ b/bin/setup_common.pl
@@ -219,9 +219,9 @@ sub md5filedigest {
 sub load_module {
     my ($module, $quiet) = @_;
 
-    if ($::check_integrity && !check_files(\%::file_md5, jp('bin', $module))) {
-	die "\n\nPart of the tools ($module) is corrupt!  Aborting...\n\n";
-    }
+#    if ($::check_integrity && !check_files(\%::file_md5, jp('bin', $module))) {
+#	die "\n\nPart of the tools ($module) is corrupt!  Aborting...\n\n";
+#    }
     eval "require \"$module\";";
     print '.' unless ($quiet);
     if ($@) {
@@ -278,13 +278,13 @@ sub check_important_files {
     return if (   $::suite_version > 4
                && !$ENV{'SPEC_CHECK'});
     $::check_integrity = 1;
-    foreach my $important_file (jp('bin', basename($0)),
-                                grep { m/$re/ } keys %::file_md5) {
-        if (!check_files(\%::file_md5, $important_file)) {
-            print STDERR "\n\nPart of the tools ($important_file) is corrupt!\nAborting...\n\n";
-            exit 1;
-        }
-    }
+#    foreach my $important_file (jp('bin', basename($0)),
+#                                grep { m/$re/ } keys %::file_md5) {
+#        if (!check_files(\%::file_md5, $important_file)) {
+#            print STDERR "\n\nPart of the tools ($important_file) is corrupt!\nAborting...\n\n";
+#            exit 1;
+#        }
+#    }
 }
 
 1;
diff --git a/bin/util.pl b/bin/util.pl
index ccf4a72477c0..c8c0cd786522 100755
--- a/bin/util.pl
+++ b/bin/util.pl
@@ -211,11 +211,11 @@ sub copy_tree {
                     offer_verify_advice();
 		    return 0;
 		}
-		if ($sumhash->{$sf} ne md5filedigest($sf)) {
-		    Log(0, "\n$sf is corrupt!\n");
-                    offer_verify_advice();
-		    return 0;
-		}
+#		if ($sumhash->{$sf} ne md5filedigest($sf)) {
+#		    Log(0, "\n$sf is corrupt!\n");
+#                    offer_verify_advice();
+#		    return 0;
+#		}
 	    }
             if ($sf =~ /\.bz2$/) {
               copy_bz2_file($sf, $file, [$target], 0);
```

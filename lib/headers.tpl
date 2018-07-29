<!DOCTYPE HTML>
<html>
<head>
    <title>%($pageTitle%)</title>
    <link rel="icon" href="/favicon.png" type="image/png" />

% for(i in `{ls $sitedir/_kwerc/css/*.min.css | grep -v dark})
%     echo '    <link rel="stylesheet" href="/_kwerc/css/'`{basename $i}^'" type="text/css" media="screen,projection">'

% if(check_user premium || ~ $req_path /premium)
%     echo '<link rel="stylesheet" href="/_kwerc/css/dark.css" type="text/css" media="screen,projection">'

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

% if(! ~ $#meta_description 0)
%     echo '    <meta name="description" content="'$"meta_description'">'
% if(! ~ $#meta_keywords 0)
%     echo '    <meta name="keywords" content="'$"meta_keywords'">'

% h = `{get_lib_file headers.inc}
% if(! ~ $#h 0)
%     cat $h

    %($"extraHeaders%)
</head>
<body>

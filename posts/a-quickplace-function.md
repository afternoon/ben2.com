---
layout: post
title: A Quickplace function
date: '2002-02-14T14:33:39+00:00'
tags: []
tumblr_url: https://aftnn.org/post/48058168385/a-quickplace-function
---
For reference:
<pre>
	function h_QuickSearchFormSubmit( ) {
		if (document.h_QuickSearchForm.h_SearchStringTmp.value == "") {
			alert('Please type in a word or a phrase.');
			document.h_QuickSearchForm.h_SearchStringTmp.focus();
			return;
		}
		if (document.h_QuickSearchForm.h_SearchStringTmp.value.indexOf(',') != -1) {
			alert('Search text cannot contain the following character:  ,');
			document.h_QuickSearchForm.h_SearchStringTmp.focus();
			return;
		}
		var string = document.h_QuickSearchForm.h_SearchStringTmp.value;
		if ( string.length &gt; 200) {
			alert('Search text is too long.');
			return;
		}
		document.h_QuickSearchForm.action = getAbsoluteRoomPath(self) + '/' +(h_Context_InFolder==1?h_Context_InFolderName:'h_Toc')+"/
$new?EditDocument&amp;Form=h_PageUI"+"&amp;PreSetFields=h_EditAction;"+
"h_New"+",h_SetReadScene;"+'h_StdPageRead'+",h_SetEditScene;"+
'h_SearchResults'+",h_ReturnToPage;"+h_PageUnid;
		document.h_QuickSearchForm.action +=
",h_SearchStart;0,h_SearchCount;15,h_SearchString;" + escape( string );
		document.h_QuickSearchForm.submit( );
	}
	document.write('</pre><form name="h_QuickSearchForm" method="post" action="javascript:h_QuickSearchFormSubmit(%20)">&rsquo;);
	document.write(&rsquo;<input class="h-searchField-text" name="h_SearchStringTmp" size="10" value="">&rsquo;);
	document.write(&rsquo;<a href="#javascript:h_QuickSearchFormSubmit(%20)">&rsquo;);
	document.write(&rsquo;<img src="'%20+%20" .. go.gif width="28" height="20" alt="' +
'QuickSearch: Click here to find pages matching any word or phrase entered in the area to the left of this button.' + '" border="0" align="top"></a></form>&rsquo;);

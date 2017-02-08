# Gmail

## searching mutiple tags with 'and'
in:inbox in:label2

## search multiple tags with 'or'
in:inbox OR in:label2

### search
from:(myemail@mydomain.com) (in:inbox OR in:label2)

### search all starred items
is:starred

### search all chats from john doe
in:chats john doe  

# Google Searches

### exact phrase 
* "use quotes"
###exact phrase with missing words 
* "I forget * words * this song "
###exclude words with minus    
* cat -dog
###synonyms , prefix a word with ~ 
* ~run
###site query, search within a website site:
* site:    site.com
###search specific sites that link to that specific site
* link: site.com
###use two peroids to indicate a range between numbers
* 21..374
###find sites that are related to specified site
* related:  www.google.com


#Google's scripting language  
https://script.google.com
```
/**
 * Creates a new site page using the Sites API.
 * For more information on using the Sites API, see
 * https://developers.google.com/apps-script/service_sites
 */
function createDemoPage() {
  var domain = 'yourdomain.com';
  var site = 'your_site';
  var pageName = 'script_center_demo';
  var html =
    '<div><div style="margin-left:auto;margin-right:auto;'
      + 'display:block;font-size:18px;font-weight:bold;"><img alt="Scripts Logo"'
      + 'border="0" src="http://gascriptcenter.appspot.com/images/docs_apps_scripts-48.gif">'
      + '&nbsp;Google Apps Script Center Project Page</div><div><p>&nbsp;</p>'
      + '<p style="font-size:14px;font-weight:bold;">Executive Summary</p>'
      + '<p>This project aims to....</p></div></div>';

  var site = SitesApp.getSite(domain, site);
  site.createWebPage('Script Center Demo', pageName, html);
};
```
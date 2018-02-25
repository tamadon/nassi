// This is GoogleAppScript

// !!!attention!!! do not record this item in github public repository
// --- start ---
var VERIFY_TOKEN = 'example';
var SHEET_ID = 'example';
// --- end ---

var SHEET_NAME = 'history';

function doPost(e) {
  if (VERIFY_TOKEN != e.parameter.token) {
    throw new Error("invalid token.");
  }
  
  var ss = SpreadsheetApp.openById(SHEET_ID);
  var sheet = ss.getSheetByName(SHEET_NAME);
  var botName = e.parameter.bot_name;
  var text = "";
  
  if (!botName) {
    throw new Error("undefined bot name.");
  }
    
  if (botName == "ミルク") {
    text = trimString(e.parameter.text)
  }
  var array = [new Date(), botName, text];
  
  sheet.appendRow(array);
}

function trimString(src){
  if (src == null || src == undefined) {
    return "";
  }
  return src.replace("bot: ", "").replace("ml :tanonda:", "");
}

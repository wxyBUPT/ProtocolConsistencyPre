
function getDatabase(){
    var db = LocalStorage.openDatabaseSync("ProtocolConsistency","1.0","StorageDatabase",1000000);
    return db;

}

// 程序打开时，初始化表
function initialize() {
    var db = getDatabase();
    db.transaction(
        function(tx) {
            // 如果setting表不存在，则创建一个
            // 如果表存在，则跳过此步
            tx.executeSql('CREATE TABLE IF NOT EXISTS project(name TEXT UNIQUE, path TEXT,time,TEXT)');
      });
}

function getBasePath(){
    return "./";
}

//创建新的工程
//如果创建成功则返回工程的路径
//如果创建失败则返回ERROR
function createNewPro(projName){
    var db = getDatabase();
    var res = ""
    db.transaction(function(tx){
        var now = new Date();
        var time = now.getTime()
        var path = getBasePath() + time;
        var rs = tx.executeSql('INSERT INTO project(name,path,time) VALUES (?,?,?);',[projName,path,time]);
        if(rs.rowsAffected > 0 ){
            res = path;
        }else{
            res = "Error";
        }
    });
    return res;
}

// 插入数据
function setSetting(setting, value) {
   var db = getDatabase();
   var res = "";
   db.transaction(function(tx) {
        var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
              //console.log(rs.rowsAffected)
              if (rs.rowsAffected > 0) {
                res = "OK";
              } else {
                res = "Error";
              }
        }
  );
  return res;
}

 // 获取数据
function getSetting(setting) {
   var db = getDatabase();
   var res="";
   db.transaction(function(tx) {
     var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
     if (rs.rows.length > 0) {
          res = rs.rows.item(0).value;
     } else {
         res = "Unknown";
     }
  })
  return res
}

function getAllProMeta(){
    var db = getDatabase();
    var res = [];
    db.transaction(function(tx){
        var rs = tx.executeSql('SELECT * FROM project')
        if(rs.rows.length > 0){
            var tmpRow = rs.rows;
            for(var i = 0;i<tmpRow.length;i++){
                var date = new Date(tmpRow.item(i).time);
                var dateStr = date.toISOString().replace(/-/g,"");
                var tmp = {
                    name:tmpRow.item(i).name,
                    path:tmpRow.item(i).path,
                    time:dateStr
                };
                res.push(tmp);
            }
        }
    })
    /**
      返回数组，数组形式为
      [
      {name:name,path:path,time:time},
      ]
      **/
    return res;
}

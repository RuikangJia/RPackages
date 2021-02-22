envirPrepare = function(wholeName){
    # 文件名和路径名称
    pathName = dirname(wholeName)
    scriptName = basename(wholeName)
    # 设置路径
    setwd(pathName)
    # 文件夹名称
    dirName = gsub(".R$","",scriptName)
    # 创建脚本文件同名文件夹
    if(!dir.exists(dirName)){
        dir.create(dirName)
    }
    # 输出文件路径
    outputDir = gsub(".R$","/",wholeName)
    return(outputDir)
}
dfSave = function(data,dataName,outputDir){
    # 保存excel
    write.csv(data,paste(outputDir,dataName,".csv",sep = ""))
    # 数据命名
    assign(dataName,data)
    # 保存RData
    save(list = dataName,file = paste(outputDir,dataName,".RData",sep = ""))
}
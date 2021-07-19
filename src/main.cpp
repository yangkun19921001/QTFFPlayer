#include "mainwindow.h"

#include <QApplication>
#include "log4z.h"
using namespace zsummer::log4z;
int main(int argc, char *argv[])
{
    ILog4zManager::getRef().start();
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    //begin test stream log input....
    LOGT("stream input *** " << "LOGT LOGT LOGT LOGT" << " *** ");
    LOGD("stream input *** " << "LOGD LOGD LOGD LOGD" << " *** ");
    LOGI("stream input *** " << "LOGI LOGI LOGI LOGI" << " *** ");
    LOGW("stream input *** " << "LOGW LOGW LOGW LOGW" << " *** ");
    LOGE("stream input *** " << "LOGE LOGE LOGE LOGE" << " *** ");
    LOGA("stream input *** " << "LOGA LOGA LOGA LOGA" << " *** ");
    LOGF("stream input *** " << "LOGF LOGF LOGF LOGF" << " *** ");

    // cannot support VC6 or VS2003
    //begin test format log input....
    LOGFMTT("format input *** %s *** %d ***", "LOGFMTT", 123456);
    LOGFMTD("format input *** %s *** %d ***", "LOGFMTD", 123456);
    LOGFMTI("format input *** %s *** %d ***", "LOGFMTI", 123456);
    LOGFMTW("format input *** %s *** %d ***", "LOGFMTW", 123456);
    LOGFMTE("format input *** %s *** %d ***", "LOGFMTE", 123456);
    LOGFMTA("format input *** %s *** %d ***", "LOGFMTA", 123456);
    LOGFMTF("format input *** %s *** %d ***", "LOGFMTF", 123456);

    LOGA("main quit ...");
    return a.exec();
}

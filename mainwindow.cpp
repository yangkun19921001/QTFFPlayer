#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include <QDebug>

extern "C"{
#include "libavcodec/avcodec.h"
#include "libavutil/avutil.h"
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    printf("Ffmpeg cmkae build = \n %s",avcodec_configuration());
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


//
// Created by ���� on 2021/7/19.
//

#include "IThread.h"


void IThread::sleep(long mis) {
    chrono::microseconds du(mis);
    this_thread::sleep_for(du);
}

int IThread::start() {
    this->isExit = false;
    this->isPauseing = false;
    thread th(&IThread::run, this);
    th.detach();
    return 1;
}

void IThread::stop() {
    isExit = true;
    LOGE("thread stop--->begin ��");
    int i = 200;
    while (i--) {//�ȴ� һ���
        if (!isRuning)
            break;
        sleep(2);
    }
    LOGE("thread stop--->success ��");
}

void IThread::setPause(int pause) {
    this->isPauseing = pause;
    for (int i = 0; i < 10; ++i) {
        if (this->isPauseing == pause)
            break;
        sleep();
    }
}

int IThread::isPause() {
    return this->isPauseing;
}




void IThread::run()  {
    LOGE("�̺߳�������");
    isRuning = true;
    main();//������ʵ��
    LOGE("�̺߳����˳�");
    isRuning = false;

}
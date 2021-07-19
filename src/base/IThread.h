//
// Created by ���� on 2021/7/19.
//

#ifndef QTFFPLAYER_ITHREAD_H
#define QTFFPLAYER_ITHREAD_H
#include <thread>
#include <vector>
#include <chrono>
#include "log4z.h"
using namespace zsummer::log4z;
using namespace std;


/**
 * ͳһ�����߳�
 * C++ 11 �߳̿�
 */
class IThread {
    /**
     * ��������
     */
public:
    /**
     * �߳̿�ʼִ��
     * @return 1 is success ��
     */
    virtual int start();

    /**
     * �߳�ֹͣ
     */
    virtual void stop();

    /**
     * �߳���ͣ
     */
    virtual void setPause(int pause);

    /**
     * �߳��Ƿ�ֹͣ
     * @return  1 is pause
     */
    virtual int isPause();

    /**
     * �߳�ִ�е����
     */
    virtual void main(){};

    /**
     * �߳�˯�� Ĭ��˯ 10 ms
     */
    void sleep(long mis = 10);

    /**
     * ����
     */
protected:
    /**
     * �߳��Ƿ��˳�
     */
    int isExit = 0;
    /**
     * �߳��Ƿ���������
     */
    int isRuning = 0;
    /**
     * �߳��Ƿ��Ѿ���ͣ
     */
    int isPauseing = 0;

/**
 * ˽�к���
 */
private:
    /**
     * �߳�ֱ�����
     */
    void run();
};


#endif //QTFFPLAYER_ITHREAD_H

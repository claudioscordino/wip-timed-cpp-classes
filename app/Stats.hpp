#ifndef __STATS_HPP__
#define __STATS_HPP__

#include<iostream>
#include<chrono>
#include<time.h>
#include<condition_variable>
#include<mutex>

#include"Msg.hpp"
#include"Skeleton.hpp"
#include"Proxy.hpp"

struct Stats {
    Skeleton<int>* skel;
    Proxy<int>* proxy;
    Msg<int> send_msg;
    uint64_t worst_case_delay = 0;
    uint64_t best_case_delay = 1000000000;
    uint64_t sum_delay = 0;
    uint64_t received_messages = 0;
    uint64_t recv_activations = 0;
    uint64_t sent_messages = 0;
    Msg<int> msg;
#ifdef SLLET
    std::condition_variable rcv_exec_cond;
    std::mutex rcv_exec_lock;
    pthread_t rcv_exec_tid;

    std::condition_variable snd_exec_cond;
    std::mutex snd_exec_lock;
    pthread_t snd_exec_tid;
#endif
};

#endif


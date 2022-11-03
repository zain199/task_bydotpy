import 'dart:developer';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/common/dio_helper.dart';
import 'package:task/models/coin_model.dart';

import '../common/end_points.dart';

class TaskPorvider extends ChangeNotifier
{

    List<TaskModel> coins=[];
    List<TaskModel> displayedData=[];
    
    Future getCoins ()async
    {
      try{
        Response res = await DioHelper.getData(path: coinsEndPoint,query: {'include_platform':false});
        List<dynamic> responseData = res.data;
        responseData.forEach((element) {
          coins.add(TaskModel.fromJson(element));
        });
        displayedData.addAll(coins.sublist(0,limit));
        pages = (coins.length/limit).ceil();
        log(coins.length.toString());
        log(displayedData.length.toString());
        log(pages.toString());
        notifyListeners();
      }catch(e)
      {
        log(e.toString());
      }
    }

    int page=1;
    int limit = 10;
    int pages = 0;
    bool loading =false;
    void getNewPage()
    {
      displayedData.addAll(coins.sublist(getStartItemInPage(),getLastItemInPage()));
      loading= false;
      page++;
      notifyListeners();
    }

    int getStartItemInPage()
    {
      return page*limit;
    }
    int getLastItemInPage()
    {
      return math.min((page*limit)+10, coins.length);
    }

    bool hasMorePages()
    {
      return (page+1 <= pages );
    }
}
# MJAiSearchSDK

[![CI Status](https://img.shields.io/travis/袁兴杨/MJAiSearchSDK.svg?style=flat)](https://travis-ci.org/袁兴杨/MJAiSearchSDK)
[![Version](https://img.shields.io/cocoapods/v/MJAiSearchSDK.svg?style=flat)](https://cocoapods.org/pods/MJAiSearchSDK)
[![License](https://img.shields.io/cocoapods/l/MJAiSearchSDK.svg?style=flat)](https://cocoapods.org/pods/MJAiSearchSDK)
[![Platform](https://img.shields.io/cocoapods/p/MJAiSearchSDK.svg?style=flat)](https://cocoapods.org/pods/MJAiSearchSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MJAiSearchSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform:ios, '9.0'  # 仅支持iOS9.0及以上设备
use_frameworks!
target 'TargetName' do
pod 'MJAiSearchSDK'
end
```
如果搜索不到，请运行``` pod repo update --verbose ```更新cocoapods仓库。

## 教程
---

#### V1.1 更新内容

1. 提供语义查询配件服务
2. 提供定损服务

## SDK简述
本SDK开发旨在提供方便快捷地获取汽车配件信息，通过VIN码或汽车品牌配置信息进行车辆定型后即可使用圈选或者配件名、OE等形式获取配件信息。 

商务合作请联系[明觉科技](http://www.dataenlighten.com)，本SDK仅提供合作客户使用，违用必究!


----------
## SDK分类
### 为方便用户使用SDK，根据自身需求选用功能模块，我们将其拆分成五大模块:
1. MJVinParseLib.framework -- VIN定型服务模块，提供VIN定型相关功能，原则上推荐所有用户选用。
2. MJAreaSearchPartLib.framework -- 圈选小汽车得到相应区域配件信息，推荐所有用户使用。
3. MJSearchPartLib.framework -- 配件搜索服务模块，提供配件名、配件OE搜索配件，推荐所有用户使用。 4. MJSearchEPCPartLib.framework -- EPC图选服务模块，提供查询周围配件功能。
5. MJDataLib.framework -- 基础通讯模块，原则上必须接入。


----------
## SDK集成步骤
1. 使用cocoapods集成SDK
4. 初始化SDK。userinfo格式请参考Demo工程。

``` objectivec
[[MJDamageAssessmentManager sharedInstance] configureWithUserInfo:userInfo complete:^(BOOL success) {}];
```
5. 愉快使用SDK其他功能。


----------
## SDK模块介绍
### 一、MJVinParseLib.framework -- VIN定型服务
#### 1.VIN定型接口，传入合法的VIN码，返回VIN解析结果。

``` objectivec
+ (void)vinParseWithVinCode:(nonnull NSString *)vinCode completion:(_Nullable ServiceResponseBlock)completion;
```


----------
#### 2.检查VIN前三位，传入VIN前三位，快速得知是否可以解析

``` objectivec
+ (void)checkVINTop3:(nonnull NSString*)vintop3 completion:(_Nullable
ServiceResponseBlock)completion;
```


----------
#### 3.获得授权可查询品牌列表

``` javascript
+ (void)getMyAuthBrandsCompletion:(_Nullable ServiceResponseBlock)completion;
```


----------
#### 4 . 获得PlanB数据- VIN无法定型时使用，传入上个接口中获得的可查询品牌。

``` objectivec
+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;
```


----------

#### 5. 根据车辆品牌，制造商以及车型获取车辆的排量以及变速箱等信息

``` objectivec
@param brand 车辆品牌 -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
@param maker 制造商 -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
@param vehicleChn 车型 -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
@param body 车体 -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
@param completion 返回数据
*/
+ (void)getPlanBBrandDetailWithBrand:(nonnull NSString*)brand maker:(nonnull NSString*)maker vehicleChn:(nonnull NSString*)vehicleChn body:(nonnull NSString*)body completion:(ServiceResponseBlock)completion;
```


----------

#### 6. OCR服务 识别行驶证(暂不提供服务)

``` objectivec
+ (void)ocrServiceWithImage:(nonnull UIImage*)image completion:(_Nullable ServiceResponseBlock)completion;
```


----------
### 二、MJAreaSearchPartLib.framework -- 圈选配件服务
#### 圈选配件服务使用方法

``` objectivec
 MJDrawCircleSearchPartController* draw = [[MJDrawCircleSearchPartController alloc]init];
draw.delegate = self;
[self addChildViewController:draw]; [self.view addSubview:draw.view];
[draw didMoveToParentViewController:self];
```
上面方法将MJDrawCircleSearchPartController中的view添加到您自己的viewcontroller中，方便使用，在添加代理之后，圈选得到的配件会在代理方法中返回，代理方法如下:

``` objectivec
- (void)canvasCircleSelectedPartsCompletion:(NSArray<NSDictionary *> *)parts;
```
当然，我们在请求开始以及结束的时候也提供了代理方法:

``` objectivec
/**
圈选之后开始请求
*/
- (void)canvasCircleRequestStart;
 /**
圈选请求结束
*/
- (void)canvasCircleRequestEnd;

```


----------
### 三、MJSearchPartLib.framework -- 配件搜索服务
#### 配件搜索服务提供以下方法:
#### 1.首字母联想-传入需要联想的字符串(可以是英文可以是中文)，即刻返回明觉标准配件名列表。

``` objectivec
+ (void)firstLetterRecommendWithText:(nonnull NSString*)text completion:(_Nullable ServiceResponseBlock)completion;
```


----------
#### 2.搜索配件接口-传入配件名以及搜索渠道(语音，手动输入，首字母)即可搜索配件。
该接口提供语义定损服务，返回数据不仅包含配件数据，也将包含用户输入的语义工项

``` objectivec
+ (void)searchPartWithName:(nonnull NSString*)name query:(MJSearchQurey)query completion:(_Nullable ServiceResponseBlock)completion;
```
----------
#### 3.二次推荐配件-每次搜索最多提供7个配件信息，当用户需要更多配件时，推荐调用此方法获得更多配件推荐。

``` objectivec
+ (void)researchPartCompletion:(_Nullable ServiceResponseBlock)completion;
```


----------
#### 4.获取配件图片
``` objectivec
+ (void)requestImageWithImageName:(nonnull NSString *)imageName
completion:(_Nullable ServiceResponseBlock)completion;
```


----------
#### 5.获取EPC图片

``` objectivec
+ (void)requestImageWithImageName:(nonnull NSString *)imageName imagepath:(nonnull NSString *)imagepath
completion:(_Nullable ServiceResponseBlock)completion;
```
----------


### 四、MJSearchEPCPartLib.framework -- 周围配件搜索服务
#### 根据OE号 EPC图片名和图片路径查询相邻配件:

``` objectivec
+ (void)searchRelatedPartsWithImageName:(nonnull NSString *)imageName imagepath: (nonnull NSString *)imagePath oeNumber:(nonnull NSString *)oeNumber completion: (_Nullable ServiceResponseBlock)completion;
```

### 五、MJOrderServiceLib.framework -- 定损服务
#### 提供定损接口，传入用户已选择的配件信息，返回相应的估价单，其中包含配件的工项价格和配件关联关系

``` objectivec
+ (void)assessmentWithParts:(nonnull NSArray *)parts  completion: (_Nullable ServiceResponseBlock)completion;
```

----------
## 错误码介绍

| ErrorCode | ErrorDesc                |
| --------- | ------------------------ |
| 9001      | 警告!非法请求!           |
| 50001     | 请先进行VIN定型          |
| 50002     | VIN码错误                |
| 50003     | 请填入正确的搜索渠道     |
| 50004     | OE号错误                 |
| 50005     | 图片名错误               |
| 50006     | 请至少先进行圈选或者搜索 |
| 50009     | 请求出错                 |
| 50010     | 没有配件                 |

## Author

袁兴杨, xingyang.yuan@dataenlighten.com

## License

MJAiSearchSDK is available under the MIT license. See the LICENSE file for more info.

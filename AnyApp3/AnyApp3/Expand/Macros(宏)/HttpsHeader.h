//
//  HttpsHeader.h
//  DuanSheLi
//
//  Created by 咖达 on 17/3/13.
//  Copyright © 2017年 咖达. All rights reserved.
//

#ifndef HttpsHeader_h
#define HttpsHeader_h

#if DEBUG
//请求主地址
static const NSString *SPHttpMainURL=@"";

static const NSString *SPOSS_MainURl=@"";

static const NSString *SPOSS_IMGURL =@"";

#else

static const NSString *SPHttpMainURL=@"";

static const NSString *SPOSS_MainURl=@"";

static const NSString *SPOSS_IMGURL =@"";

#endif

//主地址拼接
#define SPHttpMainURLWithUrl(url)  [NSString stringWithFormat:@"%@%@",KHttpMainURL,url]

#endif /* HttpsHeader_h */

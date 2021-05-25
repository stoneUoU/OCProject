//
//  YLZColor.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#ifndef YLZColorMacros_h
#define YLZColorMacros_h

#define YLZColorRed             [UIColor redColor]
#define YLZColorWhite           [UIColor whiteColor]
#define YLZColorYellow          [UIColor yellowColor]
#define YLZColorBlack           [UIColor blackColor]
#define YLZColorGreen           [UIColor greenColor]
#define YLZColorBlue            [UIColor blueColor]


/// 背景色
#define YLZColorBackGround      [UIColor colorWithHexString:@"F5F7FA"]
/// 描边颜色/按钮置灰颜色
#define YLZColorLine            [UIColor colorWithHexString:@"CECECE"]
/// 红色
#define YLZColorRedView         [UIColor colorWithHexString:@"F56C6C"]
/// 蓝色
#define YLZColorBlueView        [UIColor colorWithHexString:@"1B65B9"]

/// 标题、正文、辅助文字颜色
#define YLZColorTitleOne        [UIColor colorWithHexString:@"303133"]
#define YLZColorTitleTwo        [UIColor colorWithHexString:@"606266"]
#define YLZColorTitleThree      [UIColor colorWithHexString:@"909399"]
#define YLZColorTitleFour       [UIColor colorWithHexString:@"C0C4CC"]


#define colorHex(hex)       [UIColor colorWithHexString:hex]

//背景色
#define colorBg             [UIColor colorWithHexString:@"F5F7FA"]
#define colorBgWhite        [UIColor colorWithHexString:@"ffffff"]

//主色、主灰色
#define colorMain           [UIColor colorWithHexString:@"1B65B9"]
#define colorMainGray       [UIColor colorWithHexString:@"edf3fe"]

//辅色
#define colorSecondary1     [UIColor colorWithHexString:@"20d06a"]
#define colorSecondary2     [UIColor colorWithHexString:@"F56C6C"]
#define colorSecondary3     [UIColor colorWithHexString:@"3B71E8"]

//辅灰色
#define colorSecondaryGray1 [UIColor colorWithHexString:@"ebfcf2"]
#define colorSecondaryGray2 [UIColor colorWithHexString:@"fcf3eb"]
#define colorSecondaryGray3 [UIColor colorWithHexString:@"3CA0F6"]

//灰色
#define colorBlack          [UIColor colorWithHexString:@"000000"]
#define colorDarkGray       [UIColor colorWithHexString:@"999999"]
#define colorGray           [UIColor colorWithHexString:@"cccccc"]
#define colorLightGray      [UIColor colorWithHexString:@"dddddd"]
#define colorWhiteGray      [UIColor colorWithHexString:@"CECECE"]
#define colorWhite          [UIColor colorWithHexString:@"ffffff"]

//文字灰色
#define colorTextBlack      [UIColor colorWithHexString:@"303133"]  //黑色
#define colorTextDarkGray   [UIColor colorWithHexString:@"606266"]  //灰黑色
#define colorTextGray       [UIColor colorWithHexString:@"909399"]  //灰色
#define colorTextLightGray  [UIColor colorWithHexString:@"dddddd"]  //浅灰色
#define colorTextWhite      [UIColor colorWithHexString:@"ffffff"]  //白色

#define colorLine           [UIColor colorWithHexString:@"C0C4CC"]

#define colorHalfVisible [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.7] //半透明

#define colorTransparent [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1]//透明

#define colorClear [UIColor clearColor]//透明

/// 灰色模式下背景色
#define YLZColorDarkBackGround  [UIColor colorWithHexString:@"1a1b1c"]

/// 灰色模式下Cell背景色
#define YLZColorDarkCellBackGround  [UIColor colorWithHexString:@"272829"]

/// 灰色模式下Cell背景色
#define YLZColorSeparator  [UIColor colorWithHexString:@"f0f1f5"]

#endif /* YLZColorMacros_h */


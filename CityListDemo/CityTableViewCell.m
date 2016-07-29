//
//  CityTableViewCell.m
//  BDNM
//
//  Created by md on 16/5/13.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell
{
    UILabel *titleLab;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 40)];
        titleLab.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:titleLab];
    }
    return self;
}
- (void)contentCityTableViewCell:(CityModel *)model
{
    titleLab.text = model.city_name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

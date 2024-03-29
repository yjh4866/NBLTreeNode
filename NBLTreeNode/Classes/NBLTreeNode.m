//
//  NBLTreeNode.m
//  NBLTreeNode
//
//  Created by HTJT-yangjh on 2019/6/22.
//

#import "NBLTreeNode.h"

@implementation NBLTreeNode


#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title?:@"" forKey:@"title"];
    if (self.representedObject) {
        [aCoder encodeObject:self.representedObject forKey:@"representedObject"];
    }
    [aCoder encodeObject:self.childNodes?:@[] forKey:@"childNodes"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        _representedObject = [aDecoder decodeObjectForKey:@"representedObject"];
        _childNodes = [aDecoder decodeObjectForKey:@"childNodes"];
    }
    return self;
}


#pragma mark - Public

- (BOOL)isLeaf
{
    return self.childNodes.count < 1;
}

// 实例化方法
+ (instancetype)treeNodeWithRepresentedObject:(NSObject<NSCoding> *)modelObject
{
    return [[NBLTreeNode alloc] initWithRepresentedObject:modelObject];
}
- (instancetype)initWithRepresentedObject:(NSObject<NSCoding> *)modelObject
{
    self = [super init];
    if (self) {
        _representedObject = modelObject;
    }
    return self;
}

// 添加子结点
- (void)addChildNode:(NBLTreeNode *)childNode
{
    childNode->_parentNode = self;
    _childNodes = [self.childNodes?:@[] arrayByAddingObject:childNode];
}
// 添加子结点
- (void)addChildNodes:(NSArray<NBLTreeNode *> *)childNodes
{
    for (NBLTreeNode *node in childNodes) {
        node->_parentNode = self;
    }
    _childNodes = [self.childNodes?:@[] arrayByAddingObjectsFromArray:childNodes];
}
// 移除子结点
- (void)removeChildNode:(NBLTreeNode *)childNode
{
    if (self.childNodes.count > 0) {
        NSMutableArray *marray = [NSMutableArray arrayWithArray:self.childNodes];
        [marray removeObject:childNode];
        _childNodes = marray;
    }
}
// 移除子结点
- (void)removeChildNodes:(NSArray<NBLTreeNode *> *)childNodes
{
    if (self.childNodes.count > 0) {
        NSMutableArray *marray = [NSMutableArray arrayWithArray:self.childNodes];
        [marray removeObjectsInArray:childNodes];
        _childNodes = marray;
    }
}

// 重置子结点
- (void)resetChildNodes:(NSArray<NBLTreeNode *> *)childNodes
{
    _childNodes = [NSArray arrayWithArray:childNodes];
}

// 遍历
- (void)traverse:(BOOL(^)(NBLTreeNode *node))blockFindNode
{
    // 遍历收藏树
    NSMutableArray<NBLTreeNode*> *marrNode = [NSMutableArray arrayWithObject:self];
    while (marrNode.count > 0) {
        NBLTreeNode *node = marrNode[0];
        [marrNode removeObjectAtIndex:0];
        // 查看该结点
        if (blockFindNode) {
            // 返回了NO，结束遍历
            if (!blockFindNode(node)) {
                return;
            }
        }
        // 该结点不是叶子结点
        if (!node.isLeaf) {
            [marrNode addObjectsFromArray:node.childNodes];
        }
    }
}

// 搜索结点
- (NSArray<NBLTreeNode *> *)searchTreeNodeWith:(NSString *)searchText
{
    NSMutableArray *marrObj = [NSMutableArray array];
    [self traverse:^BOOL(NBLTreeNode * _Nonnull node) {
        // 查看该结点的标题是否符合要求
        if ([node.title rangeOfString:searchText].location != NSNotFound) {
            [marrObj addObject:node];
        }
        return YES;
    }];
    return marrObj;
}

@end

//
//  NBLTreeNode.h
//  NBLTreeNode
//
//  Created by HTJT-yangjh on 2019/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLTreeNode : NSObject <NSCoding>

@property (nonatomic, strong) NSString *title;

// 父结点
@property (readonly, weak) NBLTreeNode *parentNode;
// 子结点
@property (nonatomic, readonly) NSArray<NBLTreeNode *> *childNodes;
// 是否为叶子结点
@property (getter=isLeaf, readonly) BOOL isLeaf;

// 结点数据
@property (readonly, strong) id representedObject;

// 实例化方法
+ (instancetype)treeNodeWithRepresentedObject:(id)modelObject;
- (instancetype)initWithRepresentedObject:(id)modelObject;

// 添加子结点
- (void)addChildNode:(NBLTreeNode *)childNode;
// 添加子结点
- (void)addChildNodes:(NSArray<NBLTreeNode *> *)childNodes;
// 移除子结点
- (void)removeChildNode:(NBLTreeNode *)childNode;
// 移除子结点
- (void)removeChildNodes:(NSArray<NBLTreeNode *> *)childNodes;

// 重置子结点
- (void)resetChildNodes:(NSArray<NBLTreeNode *> *)childNodes;

// 遍历
- (void)traverse:(BOOL(^)(NBLTreeNode *node))blockFindNode;

// 搜索结点
- (NSArray<NBLTreeNode *> *)searchTreeNodeWith:(NSString *)searchText;

@end

NS_ASSUME_NONNULL_END

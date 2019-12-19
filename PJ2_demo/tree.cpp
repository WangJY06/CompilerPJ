#include "tree.h"

node *create_int(int row, int col, const long x)
{
  node *res = new node;
  res->row = row;
  res->col = col - to_string(x).length();
  res->tag = node::int_node;
  res->info.integer = x;
  return res;
};

node *create_real(int row, int col, const char *x)
{
  node *res = new node;
  res->row = row;
  res->col = col - strlen(x);
  res->tag = node::real_node;
  res->info.variable = (char *)malloc(strlen(x) + 1);
  strcpy(res->info.string, x);
  return res;
};

node *create_var(int row, int col, const char *x)
{
  node *res = new node;
  res->row = row;
  res->col = col - strlen(x);
  res->tag = node::var_node;
  res->info.variable = (char *)malloc(strlen(x) + 1);
  strcpy(res->info.variable, x);
  return res;
};

node *create_str(int row, int col, const char *x)
{
  node *res = new node;
  res->row = row;
  res->col = col - strlen(x);
  res->tag = node::str_node;
  res->info.variable = (char *)malloc(strlen(x) + 1);
  strcpy(res->info.string, x);
  return res;
};

node *create_const(int row, int col, const int x)
{
  node *res = new node;
  res->row = row;
  // DEBUG: length error ： to_string(x).length == 1
  res->col = col - strlen(const_names[x]);
  res->tag = node::const_node;
  res->info.constant = x;
  return res;
};

node *create_node(const node_kind tag, node_list *args)
{
  node *res = new node;
  if (args)
  {
    // printf("%d ", args->elem->row);
    // printf("%d\n", args->elem->col);
    res->row = args->elem->row;
    res->col = args->elem->col;
  }
  res->tag = node::node_node;
  res->info.node.tag = tag;
  res->info.node.arguments = args;
  return res;
};

node_list *push_front(node *e, node_list *r)
{
  node_list *head = new node_list;
  head->elem = e;
  head->next = r;
  return head;
};

node_list *concat(node_list *a, node_list *b)
{
  node_list *res = NULL;
  for (; a != NULL && a->elem != NULL; a = a->next)
    res = push_front(a->elem, res);
  for (; b != NULL && b->elem != NULL; b = b->next)
    res = push_front(b->elem, res);
  res = reverse(res);
  return res;
}

node_list *rev(node_list *r, node_list *s)
{
  if (r == NULL)
    return s;
  return rev(r->next, push_front(r->elem, s));
};

node_list *reverse(node_list *r)
{
  return rev(r, NULL);
};

void _print_node(node *x, int current_offset);

void _print_node_list(node_list *r, int current_offset)
{
  if (r == NULL)
    return;
  _print_node(r->elem, current_offset);
  _print_node_list(r->next, current_offset);
};

void _print_node(node *x, int current_offset)
{
  int i;
  for (i = 0; i < current_offset; i++)
    printf(" ");
  if (x == NULL)
    printf("[EMPTY]\n");
  else
  {
    switch (x->tag)
    {
    case node::int_node:
    {
      printf("integer (%d,%d) %d\n", x->row, x->col, x->info.integer);
      break;
    }
    case node::real_node:
    {
      printf("real (%d,%d) %s\n", x->row, x->col, x->info.string);
      break;
    }
    case node::var_node:
    {
      printf("identifier (%d,%d) %s\n", x->row, x->col, x->info.variable);
      break;
    }
    case node::const_node:
    {
      printf("constant (%d,%d) %s\n", x->row, x->col, const_names[x->info.constant]);
      break;
    }
    case node::type_node:
    {
      printf("type (%d,%d) %s\n", x->row, x->col, x->info.variable);
      break;
    }
    case node::str_node:
    {
      printf("string (%d,%d) %s\n", x->row, x->col, x->info.string);
      break;
    }
    case node::node_node:
    {
      printf("%s", node_names[x->info.node.tag]);
      printf(" (%d,%d)", x->row, x->col);
      printf("\n");
      _print_node_list(x->info.node.arguments, current_offset + 2);
      break;
    };
    }
  }
}

void _print_node_html(node *x);

void _print_node_list_html(node_list *r)
{
  if (r == NULL)
    return;
  _print_node_html(r->elem);
  _print_node_list_html(r->next);
};


void _print_node_html(node *x)
{
  int i;
  if (x == NULL)
    output << "{name: '', line: '', col: '', info:'empty'},\n";
  else
  {
    switch (x->tag)
    {
    case node::int_node:
    {
      output << "{name: 'integer', line: '" << x->row << "', col: '" << x->col << "', info:'" << x->info.integer << "', },";
      break;
    }
    case node::real_node:
    {
      output << "{name: 'real', line: '" << x->row << "', col: '" << x->col << "', info:'" << x->info.string << "', },";
      break;
    }
    case node::var_node:
    {
      output << "{name: 'identifier', line: '" << x->row << "', col: '" << x->col << "', info:'" << x->info.variable << "', },";
      break;
    }
    case node::const_node:
    {
      output << "{name: 'constant', line: '" << x->row << "', col: '" << x->col << "', info:'" << const_names[x->info.constant] << "', },";
      break;
    }
    case node::type_node:
    {
      output << "{name: 'type', line: '" << x->row << "', col: '" << x->col << "', info:'" << x->info.variable << "', },";
      break;
    }
    case node::str_node:
    {
      output << "{name: 'string', line: '" << x->row << "', col: '" << x->col << "', info:'" << x->info.string << "', },";
      break;
    }
    case node::node_node:
    {
      output << "{name: '"<<node_names[x->info.node.tag]<<"', line: '" << x->row << "', col: '" << x->col << "', info:'', children: [";
      _print_node_list_html(x->info.node.arguments);
      if(node_names[x->info.node.tag] == "program") output << "] };";
      else output << "] },";
      break;
    };
    }
  }
}

void print_node(node *x)
{
  _print_node(x, 0);
  output << "<html lang=\"zh-CN\"><head><title>Parse Tree</title></head><body><!--the demo root element--><div class=\"context\"><h2>Parse Tree of "<< argv_filename<<"</h2><ul id=\"demo\"><item class=\"item\":model=\"treeData\"></item></ul><div><script src=\"vue.js\"></script><!--item template--><script type=\"text/x-template\"id=\"item-template\"><li><div v-if=\"isError\">{{model.error}}</div><div :class=\"{bold: isFolder}\"@click=\"toggle\"><span v-if=\"isFolder\">[{{open?'-':''}}<b style=\"color:blue\">{{open?'':'+'}}</b>]</span> {{model.name}}<span v-if=\"model.line!=0\"> ({{model.line}},{{model.col}})</span><b style=\"color:green\"> {{model.info}}</b></div><ul v-show=\"open\"v-if=\"isFolder\"><item class=\"item\"v-for=\"(model, index) in model.children\":key=\"index\":model=\"model\"></item></ul></li></script><script>var data=";
  _print_node_html(x);
  output << "Vue.component('item',{template:'#item-template',props:{model:Object},data:function(){return{open:true}},computed:{isFolder:function(){return this.model.children&&this.model.children.length},isError:function(){return this.model.error}},methods:{toggle:function(){if(this.isFolder){this.open=!this.open}}}}); var demo=new Vue({el:'#demo',data:{treeData:data}})</script></body><style>body{font-family:Menlo,Consolas,monospace;color:#444}.context{margin-top:2%;margin-left:10%}.item{cursor:pointer}.bold{}ul{padding-left:1em;line-height:1.5em;list-style-type:dot}</style></html>";
}

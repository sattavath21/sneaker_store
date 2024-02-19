using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Product_ProductImage_ProductImageId",
                table: "Product");

            migrationBuilder.DropTable(
                name: "ProductImage");

            migrationBuilder.DropIndex(
                name: "IX_Product_ProductImageId",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "ProductImageId",
                table: "Product");

            migrationBuilder.AddColumn<string>(
                name: "ProductImageUrl",
                table: "Product",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ProductImageUrl",
                table: "Product");

            migrationBuilder.AddColumn<int>(
                name: "ProductImageId",
                table: "Product",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "ProductImage",
                columns: table => new
                {
                    ProductImageId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    ProductImagePath = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImage", x => x.ProductImageId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductImageId",
                table: "Product",
                column: "ProductImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Product_ProductImage_ProductImageId",
                table: "Product",
                column: "ProductImageId",
                principalTable: "ProductImage",
                principalColumn: "ProductImageId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}

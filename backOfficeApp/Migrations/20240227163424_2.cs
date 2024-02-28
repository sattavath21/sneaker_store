using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ItemQty",
                table: "BillItem",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ShippingReceipt",
                table: "Bill",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ItemQty",
                table: "BillItem");

            migrationBuilder.DropColumn(
                name: "ShippingReceipt",
                table: "Bill");
        }
    }
}
